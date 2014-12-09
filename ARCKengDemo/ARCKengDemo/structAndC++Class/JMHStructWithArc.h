//
//  structWithArc.h
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
    malloc struct should use memeset to zero the memory
 */

@interface JMHStructWithArc : NSObject

- (instancetype)initWithSomeObj:(id)obj;

@end
