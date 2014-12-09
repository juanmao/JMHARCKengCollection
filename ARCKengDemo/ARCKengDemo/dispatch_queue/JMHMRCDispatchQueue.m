//
//  JMHMRCDispatchQueue.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHMRCDispatchQueue.h"

@interface JMHMRCDispatchQueue()

@property (nonatomic, assign) dispatch_queue_t myQueue;

@end

@implementation JMHMRCDispatchQueue

- (instancetype)init
{
    if (self = [super init]) {
        self.myQueue = dispatch_queue_create("com.juanmao.juanjuan", DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}

- (void)dosomething
{
    LogFunctionNameAndClassName;
    dispatch_sync(self.myQueue, ^{
        
    });
}

- (void)dealloc
{
    LogFunctionNameAndClassName;
    dispatch_release(self.myQueue) ;
    
    [super dealloc];
}

@end
