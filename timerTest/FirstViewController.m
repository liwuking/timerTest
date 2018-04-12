//
//  FirstViewController.m
//  timerTest
//
//  Created by lbe on 2018/4/12.
//  Copyright © 2018年 liwuyang. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property(nonatomic, weak)NSTimer *timer;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn setTitle:@"POP" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickPop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    //创建后会自动以NSDefaultRunLoopMode默认模式添加到当前RunLoop中，所以可以正常工作
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerFire) userInfo:nil repeats:YES];
    
     /* 如果不把timer2添加到RunLoop中是无法正常工作的(注意如果想要在滚动UIScrollView时timer2可以正常工作可以将NSDefaultRunLoopMode改为NSRunLoopCommonModes)
      
      NSTimer以timerWithTimeInterval创建以后并没有赋值给self.timer,因为timer是weak属性，赋值后会立即释放。直到timer被添加到Runloop后才会赋值给self.timer.
      为了确保定时器正常运转，在timer被添加到runloop后，会执行一次retain。
      
      */
//    self.timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(timerFire) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    /*
     解决定时器的循环引用问题有两种方式：1，将target分离出来单独一个对象，通过对象间接使用NSTimer。2。转移target，直接增加NSTimer扩展（分类），让NSTimer自身做为target，同时可以将操作selector封装到block中。后者相对优雅，也是目前使用较多的方案
     */
    
    /*
     无论是一次性执行的timer还是重复执行的timer，只要调用invalidate，timer就会变得无效，只是一次性执行的timer会自动调用invalidate
     */
    
    /*
     timer的执行总是在固定的时间，如果错过了，就会跳过，继续执行下面的固定时间，比如10:01,10:02,10:03,10:04.可能跳过10:02直接执行10:03
     */
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.timer invalidate];
    
}

-(void)clickPop {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)timerFire {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)dealloc {
     NSLog(@"%@", NSStringFromSelector(_cmd));
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
