//
//  JMHMethodChild.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHMethodChild.h"

@interface JMHMethodChild()

@property (nonatomic, strong) id obj;

@end
@implementation JMHMethodChild

- (void)setObj:(id)obj
{
    LogFunctionNameAndClassName;
    _obj = obj;
}

@end
