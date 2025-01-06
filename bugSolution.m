To fix this, the delegate's `someMethodWithObject` method must retain the `myObject` instance:

```objectivec
@implementation MyDelegate
- (void)someMethodWithObject:(MyObject *)object {
    // Fix: Retain object (using strong property or similar)
    self.myObject = object;  // Assuming you have a strong property in your delegate
    // ... process object ...
}
@end

//Or better: Use blocks and avoid retaining myObject:

```objectivec
@implementation MyClass
- (void)someMethod {
    MyObject *myObject = [[MyObject alloc] init];
    __weak typeof(self) weakSelf = self;  //Avoid retain cycles
    [self.delegate someMethodWithObject:myObject completionBlock:^(MyObject *obj){
        //Use myObject here, it will be retained within the block until the block completes
    }];
}
@end

@interface MyDelegate <NSObject>
- (void)someMethodWithObject:(MyObject *)object completionBlock:(void (^)(MyObject *obj))completion;
@end
```
Alternatively, using `strong` properties should also be done carefully to avoid retain cycles.