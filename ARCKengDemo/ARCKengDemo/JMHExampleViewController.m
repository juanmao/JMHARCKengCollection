//
//  JMHExampleViewController.m
//  ARCKengDemo
//
//  Created by juanmao on 14/12/8.
//  Copyright (c) 2014年 juanmao. All rights reserved.
//

#import "JMHExampleViewController.h"
#import "JMHExampleObj.h"
#import "JMHStructWithArc.h"


@interface JMHExampleViewController ()<JMHExampleObjDelegate>
@property (nonatomic, strong) JMHExampleObj *exampleObj;
@property (nonatomic, strong) NSTimer *myTimer;

- (void)setUpView;

- (void)didClickBackButton;

- (void)didClickStrongDelegateRetainCycleButton;
- (void)didClickWeakDelegateNoRetainCycleButton;

- (void)didClickBlockRetainCycleButton;
- (void)didClickBlockNoRetainCycleButton;
- (void)didClickBlockPropertyRetainCycleButton;

- (void)didClickSynchronizedSelfBlockRetainCycleButton;
- (void)didClickBlockNoCycleButton;

@end

@implementation JMHExampleViewController
{
    NSArray *_array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    LogFunctionNameAndClassName;
}

- (void)setUpView
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(didClickBackButton)];
    self.navigationItem.title = @"Retain Cycle Example";
    
    SEL strongDelegateSel = @selector(didClickStrongDelegateRetainCycleButton);
    SEL weakDelegateSel = @selector(didClickWeakDelegateNoRetainCycleButton);
    SEL blockRetainSel = @selector(didClickBlockRetainCycleButton);
    SEL blockNoRetainSel = @selector(didClickBlockNoRetainCycleButton);
    SEL blockPropertyRetainSel = @selector(didClickBlockPropertyRetainCycleButton);
    SEL timerRetainSel = @selector(didClickTimerRetainCycleButton);
    SEL structRetainCycleSel = @selector(didClickStructRetainCycleButton);
    SEL synchronizedSel = @selector(didClickSynchronizedSelfBlockRetainCycleButton);
    SEL blockNoCycleSel = @selector(didClickBlockNoCycleButton);
    
    static const NSUInteger count = 9;
    SEL selList[count] = {strongDelegateSel, weakDelegateSel, blockRetainSel, blockNoRetainSel, blockPropertyRetainSel, timerRetainSel, structRetainCycleSel, synchronizedSel, blockNoCycleSel};
    
    for (int i = 0; i < count; ++i) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, i * 50 + 80, self.view.bounds.size.width - 20, 40)];
        [button setTitle:NSStringFromSelector(selList[i]) forState:UIControlStateNormal];
        button.backgroundColor = [UIColor whiteColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:selList[i] forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)didClickBackButton
{
    LogFunctionNameAndClassName;
    [self dismissViewControllerAnimated:YES completion:^{
//        [self.myTimer invalidate];
//        self.myTimer = nil;
    }];
}

- (void)didClickStrongDelegateRetainCycleButton
{
    LogFunctionNameAndClassName;
    self.exampleObj = [[JMHExampleObj alloc] init];
    self.exampleObj.delegate = self;
    [self didClickBackButton];
}

- (void)didClickWeakDelegateNoRetainCycleButton
{
    LogFunctionNameAndClassName;
    self.exampleObj = [[JMHExampleObj alloc] init];
    self.exampleObj.weakDelegate = self;
    [self didClickBackButton];
}

- (void)didClickBlockRetainCycleButton
{
    LogFunctionNameAndClassName;
    self.exampleObj = [[JMHExampleObj alloc] init];
    self.exampleObj.myBlock = ^{
        [self doSomething];
    };
    [self didClickBackButton];
}

- (void)didClickBlockNoRetainCycleButton
{
    LogFunctionNameAndClassName;
    __weak typeof(self) welf = self;
    self.exampleObj = [[JMHExampleObj alloc] init];
    self.exampleObj.myBlock = ^{
        __strong typeof(self) sself = welf;
        [sself doSomething];
    };
    [self didClickBackButton];
}

- (void)didClickBlockPropertyRetainCycleButton
{
    LogFunctionNameAndClassName;
    self.exampleObj = [[JMHExampleObj alloc] init];
    self.exampleObj.myBlock = ^{
        _array = [NSArray array];
    };
    [self didClickBackButton];
}

- (void)didClickTimerRetainCycleButton
{
    LogFunctionNameAndClassName;
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(doSomething) userInfo:nil repeats:YES];
    [self didClickBackButton];
}

- (void)didClickStructRetainCycleButton
{
    LogFunctionNameAndClassName;
    __unused JMHStructWithArc *jmhStruct = [[JMHStructWithArc alloc] initWithSomeObj:self];
    [self didClickBackButton];
}

- (void)didClickSynchronizedSelfBlockRetainCycleButton
{
    LogFunctionNameAndClassName;
    self.exampleObj = [[JMHExampleObj alloc] init];
    self.exampleObj.myBlock = ^{
        @synchronized(self){
            NSLog(@"juanmao synchronized");
        }
    };
    [self didClickBackButton];
}

- (void)didClickBlockNoCycleButton
{
    LogFunctionNameAndClassName;
    JMHExampleObj *obj = [[JMHExampleObj alloc] init];
    [obj doSomethingInBlock:^{
        [self doSomething];
    }];
    [self didClickBackButton];
}

#pragma makr -
#pragma mark JMHExampleObjDelegate

- (void)doSomething
{
   LogFunctionNameAndClassName;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
