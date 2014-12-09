//
//  JMHMRCChildObj.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/4.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHMRCChildObj.h"

@implementation JMHMRCChildObj

- (instancetype)initWithObj:(id)obj
{
    if (self = [super init]) {
        _obj = obj;
    }
    
    return self;
}

- (void)dealloc
{
    LogFunctionNameAndClassName;
    [super dealloc];
}

@end
