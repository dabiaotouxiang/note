### manjaro没有声音
1. 打开terminal
2. 输入aplay -l
会显示所有的声卡
3. vim ~/.asoundrc
4. 写入
```
pcm .!default {
          type hw
          card 1
}
ct1 .!default {
          type hw
          card 1
}
```
如果还不行的话可以修改card的number
5. 有仁兄说试了这个开不了机了，慎用