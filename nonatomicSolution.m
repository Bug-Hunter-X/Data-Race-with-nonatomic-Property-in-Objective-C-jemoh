To address the data race, you need to synchronize access to `dataArray`.  One approach is using Grand Central Dispatch (GCD):

```objectivec
@property (nonatomic, strong) NSMutableArray *dataArray;

- (void)updateData:(NSArray *)newData {
    dispatch_barrier_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{ 
        [self.dataArray addObjectsFromArray:newData];
    });
}
```

`dispatch_barrier_async` ensures that only one update happens at a time.  Other synchronization mechanisms like locks (`@synchronized`) or other GCD primitives can also be used, depending on your specific needs.  Using `atomic` properties is another option but comes with a performance cost.