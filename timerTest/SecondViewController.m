//
//  SecondViewController.m
//  timerTest
//
//  Created by lbe on 2018/4/12.
//  Copyright © 2018年 liwuyang. All rights reserved.
//

#import "SecondViewController.h"
#import "TimerProxy.h"
#import "NSTimer+XBlock.h"
@interface SecondViewController ()
@property(nonatomic, strong)TimerProxy *timerProxy;
@property(nonatomic, weak)NSTimer *timer;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"POP" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickPop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    self.timerProxy = [[TimerProxy alloc] init];
    [self.timerProxy timerWithTimeInterval:1 selector:^{
        NSLog(@"timer repeat");
    } repeats:YES];
    
    
//    self.timer = [NSTimer xxxxscheduledTimerWithTimeInterval:1 repeats:true block:^{
//        NSLog(@"sssssssss");
//    }];
}

-(void)clickPop {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
//    [self.tiemr invalidate];
}

-(void)dealloc {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.timerProxy invalidate];
//    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
