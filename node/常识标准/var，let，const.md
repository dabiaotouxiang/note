ES6之后，不建议使用var

对于let和const:
1. const一旦定义就不可改变
2. 大部分情况下const的出场率比let高很多，所以一般建议默认使用const，除非一定要改变变量的值，再使用let。

const：
1. 如果定义了一个基本数据类型，比如number，string 。。。这样的话是常量，绝对不可改变。

2. 如果用const去定义一个Object或者Array，只能说Object或者Array本身是常量，但是还是可以他们添加删除或修改属性或者元素的。。。

建议：
为了让自己的代码可读性更好，建议定义完之后不再对其进行调整就用const，反之用let，var的话尽量少用或不用