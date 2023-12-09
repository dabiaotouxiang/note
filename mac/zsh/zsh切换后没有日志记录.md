1. Mojave
2. 在`/etc/zshrc`里面添加
```
HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=1000
setopt sharehistory
setopt extendedhistory
```