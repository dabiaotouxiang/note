1. http
```
git config --global http.proxy http://127.0.0.1:1080

git config --global https.proxy http://127.0.0.1:1080

git config --global --unset http.proxy

git config --global --unset https.proxy
```
2. socks5
```
git config --global http.proxy socks5://127.0.0.1:1080
git config --global https.proxy socks5://127.0.0.1:1080
```
3. ssr的端口点进app的settings看一下
4. git@协议。在`~/.ssh/config`中
```
Host github.com
ProxyCommand nc -X 5 -x 127.0.0.1:1080 %h %p
```
5. windows下
```
Host github.com
ProxyCommand connect -S 127.0.0.1:1080 %h %p
```