## 初次理解
**有了新的理解再更新**
有关异步的方法如何判断，除了方法的开始时间外，还要考虑方法的结束时间，比如下面这个在网上找的例子:
```
// 第一种
A();
B();
C();
D();
E();
// 第二种
A(function(){
    B(function(){
        C(function(){
            D(function(){
                E();
            });
        });
    });
});
// 我们假设第一种和第二种之间不存在互相的调用关系
// 两种调用顺序看似都是A -> B -> C -> D -> E
// 实际上函数的执行是一个过程，真正的过程应该是。
// 第一种: A start -> A return -> B start -> B return -> C start -> C return -> D start -> D return -> E start -> E return
// 第二种: A start -> B start -> C start -> D start -> E start -> E return -> D return -> C return -> B return -> A return
```

## 更新

* JavaScript是单线程的，在第一种不存在互相调用，且没有回调函数的情况下，第一种都是在线程（执行栈）中进行。
* 而第二种，不互相调用，至少存在回调函数，而回调函数都是存在于task queue。等待event loop去执行的。可以理解为都是异步的。具体的可以看http://www.ruanyifeng.com/blog/2014/10/event-loop.html
* node的机制是，当前可执行的全部执行完，再将task queue中的由event loop抽取到执行栈，然后执行执行栈的。然后依此循环，可以看最下面的下载git的代码

```
const repo = 'github:su37josephxia/vue-template';
const download_path = '../test';

success = clone(repo, download_path);

// 对于整个下载过程进行了一下封装 这里用的async，await
// 对于异步来说，可以看到在执行clone的过程中，同时执行了下面'test'的打印，确实会带来一定的性能的提升，
// 对于这类异步的测试，必须要有两个方法，一个方法进行还未取得结果的时候，另一个方法就已经开始运行。可以看到console.log(success);打印出来的是Promise { <pending> }
// 但是对于async，promisify，await的关系，以及各自的作用还不清楚 **********************************
// 目前认为async表明该函数为异步函数，存在回调函数，该回调函数由await标明，而promisify标明该函数可以被await修饰
// 方法运行到回调函数的时候，将回调函数扔到task queue，等待下面的执行完，再执行回调函数和异步方法剩下的。
async function clone(repo, download_path) {

    // 从内置module中获取promisify
    console.log(1)
    const { promisify } = require('util')
    // 从git下载东西的库
    console.log(2)
    const download = promisify(require('download-git-repo'));
    // const download = require('download-git-repo');
    console.log(3)
    // 展示下载开始结束的库
    const ora = require('ora');
    const process = ora(`正在下载...${repo}`);
    process.start();

    // await
    try {
        console.log('\n4')
        await download(repo, download_path);
        // download(repo, download_path);
        console.log('\n5')
    } catch (error) {
        process.fail();
        return false;
    }
    console.log(6)
    process.succeed();
    console.log(7)
    return true;

}
console.log(success);
console.log('test');
console.log('test1');
console.log('test2');
console.log('test3');
console.log('test4');
console.log('test5');
```