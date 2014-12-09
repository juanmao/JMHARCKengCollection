//
//  JMHARCParentObj.h
//  ARCKengDemo
//
//  Created by juanmao on 14/12/4.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//


/***************************
 
   父类是ARC，子类是MRC
   子类使用父类的成员变量
   导致崩溃
 
****************************/

#import <Foundation/Foundation.h>

@interface JMHARCParentObj : NSObject
{
    id _obj;
}

@end
