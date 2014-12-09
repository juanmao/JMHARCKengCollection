//
//  UIButton+JMHFactory.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "UIButton+JMHFactory.h"

@implementation UIButton(JMHFactory)
+ (UIButton *)jmh_demoButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
    //custom setting
    
    return button;
}

@end
