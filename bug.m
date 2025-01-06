In Objective-C, a common yet subtle error arises when dealing with memory management and object lifecycles, specifically with delegate patterns.  Consider this scenario:

```objectivec
@protocol MyDelegate <NSObject>
- (void)someMethodWithObject:(MyObject *)object;
@end

@interface MyClass : NSObject
@property (nonatomic, weak) id <MyDelegate> delegate;
// ... other methods ...
@end

@implementation MyClass
- (void)someMethod {
    MyObject *myObject = [[MyObject alloc] init];
    [self.delegate someMethodWithObject:myObject];
}
@end
```

The problem: If `myObject` is not retained by the delegate's `someMethodWithObject` method, it will be deallocated immediately after the method call, potentially leading to a crash if the delegate tries to use it later.  The `weak` property ensures that `self.delegate` is not retained.  
This is easily missed because there is no immediate runtime warning. The application might crash later or exhibit unpredictable behavior.