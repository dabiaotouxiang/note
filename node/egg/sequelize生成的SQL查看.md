对于单条，可以这样
```
User.find(1).on('sql', console.log).then(function(user) {
```