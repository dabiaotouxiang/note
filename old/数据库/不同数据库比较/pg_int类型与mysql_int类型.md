mysql与postgresql在语句上有很多的差异，前两天就遇到了一例

<!-- more -->

这个是由于数据库从mysql转移到pg遗留的问题，当然也是我写代码不规范导致的。
在对一个变量检验的时候，我直接用了这个语句来校验它是id还是sentence
`select * from corpus where corpus.intentid = id_or_sentence`
而corpus.intentid是int类型，如果查询到了就按id来，没查到就按字符串来

mysql没有报过错
而pg就会报int类型不能与字符串类型比较的错
后面改成了
`id_or_sentence.isdigit()`进行判断