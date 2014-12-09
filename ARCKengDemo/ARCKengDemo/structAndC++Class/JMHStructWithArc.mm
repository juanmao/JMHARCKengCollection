//
//  structWithArc.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHStructWithArc.h"

struct JMHStruct{
    NSArray *list;
    id       someObj;
};

@implementation JMHStructWithArc
{
    struct JMHStruct *_myDemoStruct;
}

- (instancetype)init
{
    if (self = [super init]) {
        _myDemoStruct = (struct JMHStruct *)malloc(sizeof(struct JMHStruct));
        _myDemoStruct->list = [NSArray array];
        /*
         MRC code 
         id temp = [NSArray array];
        [_myDemoStruct->list release];//but now _myDemoStruct->list is a random address，so crashed.
        _myDemoStruct->list = [temp retain];
         */
    }
    
    return self;
}

- (instancetype)initWithSomeObj:(id)obj
{
    if (self = [super init]) {
        _myDemoStruct = (struct JMHStruct *)malloc(sizeof(struct JMHStruct));
        memset(_myDemoStruct, 0, sizeof(struct JMHStruct));
        /*
         or calloc
         */
        
        _myDemoStruct->someObj = obj;
    }
    
    return self;
}

- (void)dealloc
{
    LogFunctionNameAndClassName;
    free(_myDemoStruct);
    _myDemoStruct = nil;
}

@end
