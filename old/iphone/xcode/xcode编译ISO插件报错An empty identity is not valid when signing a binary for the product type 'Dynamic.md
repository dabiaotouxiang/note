Xcode 10.2 编译Tweak项目报错: 

An empty identity is not valid when signing a binary for the product type 'Dynamic Library'. (in target 'tsprite')


在该项目的target的build settings 中添加一个参数, 点击Add User-Defined Setting, 添加CODE_SIGNING_ALLOWED=NO, 重新编译, 问题解决.
