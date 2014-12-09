//
//  JMHARCChildObj.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/4.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHARCChildObj.h"

@implementation JMHARCChildObj

- (instancetype)initWithObj:(id)obj
{
    if (self = [super init]) {
        _obj = obj;
        /*
         mrc code
         [_obj release];
         _obj = [obj retain];
         */
    }
    
    return self;
}

- (void)dealloc
{
    _obj = nil;
    NSLog(@"%@ dealloc", NSStringFromClass([self class]));
}

@end
