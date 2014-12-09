//
//  JMHViewController.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/4.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHViewController.h"
#import "JMHMRCChildObj.h"
#import "JMHARCChildObj.h"
#import "JMHExampleObj.h"
#import "JMHStructWithArc.h"
#import "JMHExampleViewController.h"
#import "JMHMethodChild.h"
#import "JMHMRCDispatchQueue.h"
#import "JMHARCDispatchQueue.h"

@interface JMHViewController ()

@property (nonatomic, assign) NSUInteger exampleUInterger;

- (void)setUpView;
- (void)doSomething;

- (void)didClickMrcChildArcParentButton;
- (void)didClickArcChildMrcParentButton;
- (void)didClickRetainCycleButton;

- (void)didClickStructMallocCrashButton;
- (void)didClickMethodChildButton;

- (void)didClickMrcDispatchQueueButton;
- (void)didClickArcDispatchQueueButton;

- (void)didClickNilBlockCrashButton;
- (void)didClickAutoReleaseCrashButton;

@end

@implementation JMHViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpView];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)setUpView
{
    SEL mrcChildArcParentSel = @selector(didClickMrcChildArcParentButton);
    SEL arcChildMrcParentSel = @selector(didClickArcChildMrcParentButton);
    SEL retainCycleSel = @selector(didClickRetainCycleButton);
    SEL structMallocCrashSel = @selector(didClickStructMallocCrashButton);
    SEL clickMethodChildSel = @selector(didClickMethodChildButton);
    SEL mrcDispatchQueueSel = @selector(didClickMrcDispatchQueueButton);
    SEL arcDispatchQueueSel = @selector(didClickArcDispatchQueueButton);
    SEL nilBlockCrashSel = @selector(didClickNilBlockCrashButton);
    SEL autoReleaseCrashSel = @selector(didClickAutoReleaseCrashButton);

    
    static const NSUInteger count = 9;
    SEL selList[count] = {mrcChildArcParentSel, arcChildMrcParentSel, retainCycleSel, structMallocCrashSel, clickMethodChildSel, mrcDispatchQueueSel, arcDispatchQueueSel, nilBlockCrashSel, autoReleaseCrashSel};
    
    for (int i = 0; i < count; ++i) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, i * 50 + 80, self.view.bounds.size.width - 20, 40)];
        [button setTitle:NSStringFromSelector(selList[i]) forState:UIControlStateNormal];
        button.backgroundColor = [UIColor blackColor];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:selList[i] forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)didClickMrcChildArcParentButton
{
    LogFunctionNameAndClassName;
    __unused JMHMRCChildObj *childObj = [[JMHMRCChildObj alloc] initWithObj:[[NSObject alloc] init]];
}

- (void)didClickArcChildMrcParentButton
{
    LogFunctionNameAndClassName;
    __unused JMHARCChildObj *childObj = [[JMHARCChildObj alloc] initWithObj:[[NSObject alloc] init]];
}

- (void)didClickRetainCycleButton
{
    LogFunctionNameAndClassName;
    JMHExampleViewController *vc = [[JMHExampleViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:^{
        
    }];
}

- (void)didClickMethodChildButton
{
    LogFunctionNameAndClassName;
    JMHMethodChild *child = [[JMHMethodChild alloc] init];
    child.obj = self;
}

- (void)didClickStructMallocCrashButton
{
    LogFunctionNameAndClassName;
    __unused JMHStructWithArc *myStruct = [[JMHStructWithArc alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didClickMrcDispatchQueueButton
{
    LogFunctionNameAndClassName;
    JMHMRCDispatchQueue *mrcQueue = [[JMHMRCDispatchQueue alloc] init];
    [mrcQueue dosomething];
}

- (void)didClickArcDispatchQueueButton
{
    LogFunctionNameAndClassName;
    JMHARCDispatchQueue *arcQueue = [[JMHARCDispatchQueue alloc] init];
    [arcQueue dosomething];
}

- (void)didClickNilBlockCrashButton
{
    LogFunctionNameAndClassName;
    JMHExampleObj *obj = [[JMHExampleObj alloc] init];
    [obj doSomethingInBlock:nil];
}

//alantao 出品
- (void)didClickAutoReleaseCrashButton
{
    LogFunctionNameAndClassName;
    NSError *error = nil;
    JMHExampleObj *obj = [[JMHExampleObj alloc] init];
    [obj doSomeNBthing:&error];
    NSLog(@"error is %@", error);
}

- (void)doSomething
{
    //do something
}

@end
