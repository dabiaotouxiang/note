```shell
alias setproxy="export http_proxy=socks5h://127.0.0.1:1086; export https_proxy=socks5h://127.0.0.1:1086; echo 'HTTP Proxy on';"
alias unsetproxy="unset http_proxy; unset https_proxy; echo 'HTTP Proxy off';"
```

1. socks5和socks5h的区别，socks5指在本地解析访问的域名，socks5h指在代理进行域名的解析，socks5对应curl的--socks5，socks5h对应curl的--socks5-hostname。目前发现用socks5代理访问`raw.githubusercontent.com`设置为socks5h可以，设置为socks5就不行
