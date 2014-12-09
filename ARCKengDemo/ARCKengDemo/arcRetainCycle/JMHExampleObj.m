//
//  JMHExampleObj.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHExampleObj.h"

@implementation JMHExampleObj

- (void)dealloc
{
    LogFunctionNameAndClassName;
}


- (void)doSomethingInBlock:(exampleBlock)block
{
    block();
    /*
     should be if(block) block();
     */
}

- (void)doSomeNBthing:(NSError **)error
{
    @autoreleasepool {
        if (error) {
            *error = [[NSError alloc] initWithDomain:@"com.juanmao" code:1 userInfo:nil];
        }
    }
}

@end
