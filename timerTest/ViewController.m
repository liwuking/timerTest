//
//  ViewController.m
//  timerTest
//
//  Created by lbe on 2018/4/12.
//  Copyright © 2018年 liwuyang. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
}

- (IBAction)clickNext:(id)sender {
    
    FirstViewController *vc = [[FirstViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
}
- (IBAction)clickNext2:(id)sender {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
