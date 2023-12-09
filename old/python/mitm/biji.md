```
import os
import sys
import ipaddress
from OpenSSL import SSL
from typing import Optional
from mitmproxy import ctx, connection
from mitmproxy.proxy.layers import tls
from mitmproxy.net import tls as net_tls
from mitmproxy.tools.main import mitmweb, mitmproxy

MY_DEFAULT_CIPHERS = (
    "TLS_AES_128_GCM_SHA256",
    "TLS_AES_256_GCM_SHA384",
    "TLS_CHACHA20_POLY1305_SHA256",
    "ECDHE-ECDSA-AES256-GCM-SHA384",
    "ECDHE-ECDSA-AES128-GCM-SHA256",
    "ECDHE-ECDSA-CHACHA20-POLY1305",
    "ECDHE-RSA-AES256-GCM-SHA384",
    "ECDHE-RSA-AES128-GCM-SHA256",
    "ECDHE-RSA-CHACHA20-POLY1305",
    "ECDHE-ECDSA-AES256-SHA384",
    "ECDHE-ECDSA-AES128-SHA256",
    "ECDHE-ECDSA-AES256-SHA",
    "ECDHE-ECDSA-AES128-SHA",
    "ECDHE-RSA-AES256-SHA384",
    "ECDHE-RSA-AES128-SHA256",
    "ECDHE-RSA-AES256-SHA",
    "ECDHE-RSA-AES128-SHA"
)

def my_tls_start_server(self, tls_start: tls.TlsStartData) -> None:
    """Establish TLS between proxy and server."""
    client: connection.Client = tls_start.context.client
    server: connection.Server = tls_start.context.server
    assert server.address

    if ctx.options.ssl_insecure:
        verify = net_tls.Verify.VERIFY_NONE
    else:
        verify = net_tls.Verify.VERIFY_PEER

    if server.sni is None:
        server.sni = client.sni or server.address[0]

    if not server.alpn_offers:
        if client.alpn_offers:
            if ctx.options.http2:
                # We would perfectly support HTTP/1 -> HTTP/2, but we want to keep things on the same protocol
                # version. There are some edge cases where we want to mirror the regular server's behavior
                # accurately, for example header capitalization.
                server.alpn_offers = tuple(client.alpn_offers)
            else:
                server.alpn_offers = tuple(x for x in client.alpn_offers if x != b"h2")
        else:
            # We either have no client TLS or a client without ALPN.
            # - If the client does use TLS but did not send an ALPN extension, we want to mirror that upstream.
            # - If the client does not use TLS, there's no clear-cut answer. As a pragmatic approach, we also do
            #   not send any ALPN extension in this case, which defaults to whatever protocol we are speaking
            #   or falls back to HTTP.
            server.alpn_offers = []

    if not server.cipher_list and ctx.options.ciphers_server:
        server.cipher_list = ctx.options.ciphers_server.split(":")
    # don't assign to client.cipher_list, doesn't need to be stored.
    cipher_list = server.cipher_list or MY_DEFAULT_CIPHERS

    client_cert: Optional[str] = None
    if ctx.options.client_certs:
        client_certs = os.path.expanduser(ctx.options.client_certs)
        if os.path.isfile(client_certs):
            client_cert = client_certs
        else:
            server_name: str = server.sni or server.address[0]
            p = os.path.join(client_certs, f"{server_name}.pem")
            if os.path.isfile(p):
                client_cert = p

    ssl_ctx = net_tls.create_proxy_server_context(
        min_version=net_tls.Version[ctx.options.tls_version_client_min],
        max_version=net_tls.Version[ctx.options.tls_version_client_max],
        cipher_list=tuple(cipher_list),
        verify=verify,
        hostname=server.sni,
        ca_path=ctx.options.ssl_verify_upstream_trusted_confdir,
        ca_pemfile=ctx.options.ssl_verify_upstream_trusted_ca,
        client_cert=client_cert,
        alpn_protos=tuple(server.alpn_offers),
    )
    ssl_ctx.set_grease_enabled(True)
    ssl_ctx.enable_signed_cert_timestamps()
    ssl_ctx.enable_ocsp_stapling()
    tls_start.ssl_conn = SSL.Connection(ssl_ctx)
    if server.sni:
        try:
            ipaddress.ip_address(server.sni)
        except ValueError:
            tls_start.ssl_conn.set_tlsext_host_name(server.sni.encode())
        else:
            # RFC 6066: Literal IPv4 and IPv6 addresses are not permitted in "HostName".
            # It's not really ideal that we only enforce that here, but otherwise we need to add checks everywhere
            # where we assign .sni, which is much less robust.
            pass
    tls_start.ssl_conn.set_connect_state()

def start_proxy():
    mitmproxy(['-s', 'CopyHttpxCode.py'])

def start_web():
    mitmweb(['--web-host', '0.0.0.0'])

if __name__ == '__main__':
    from mitmproxy.addons import tlsconfig
    from mitmproxy.addons.tlsconfig import TlsConfig
    tlsconfig.DEFAULT_CIPHERS = MY_DEFAULT_CIPHERS
    TlsConfig.tls_start_server = my_tls_start_server
    # print(sys.argv)
    if sys.argv[1] == "proxy":
        start_proxy()
    elif sys.argv[1] == "web":
        start_web()
    # start_proxy()



```