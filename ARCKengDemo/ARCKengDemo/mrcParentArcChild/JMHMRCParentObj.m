//
//  JMHMRCParentObj.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/4.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHMRCParentObj.h"

@implementation JMHMRCParentObj

- (void)dealloc
{
    NSLog(@"%@ dealloc, the retainCount of obj is %lu", NSStringFromClass([self class]), (unsigned long)[_obj retainCount]);
    [super dealloc];
}

@end
