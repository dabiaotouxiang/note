# 手机号的存储一定要用varchar
<!-- more -->
前几天用django写的项目一直，一开始用sqlite测没问题，后来和同事的代码合并后转到了pg，一直没有再测，
今天发现报错
```
django.db.utils.DataError: integer out of range
```
一查才知道是用int类型存储手机号的问题。  
django默认的int类型长度大该是十位数，而手机号至少是11位  
另外手机号还有前缀，有的为了标明区域还会加字符  
所以手机号最好都用varchar类型