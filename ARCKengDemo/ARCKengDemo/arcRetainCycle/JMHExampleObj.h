//
//  JMHExampleObj.h
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^exampleBlock)(void);

@protocol JMHExampleObjDelegate <NSObject>

- (void)doSomething;

@end

@interface JMHExampleObj : NSObject

@property (nonatomic, assign) NSUInteger objCount;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSObject *obj;
@property (nonatomic, strong) id<JMHExampleObjDelegate> delegate;
@property (nonatomic, strong) exampleBlock myBlock;
@property (nonatomic, weak) id<JMHExampleObjDelegate> weakDelegate;

- (void)doSomethingInBlock:(exampleBlock)block;
- (void)doSomeNBthing:(NSError **)error;
@end
