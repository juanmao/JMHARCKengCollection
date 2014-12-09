//
//  JMHMRCParentObj.h
//  ARCKengDemo
//
//  Created by juanmao on 14/12/4.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import <Foundation/Foundation.h>
/*********************
 
 父类是Mrc，子类是Arc，
 子类给成员变量赋值，
 导致内存泄露

 ********************/

@interface JMHMRCParentObj : NSObject
{
    id _obj;
}

@end
