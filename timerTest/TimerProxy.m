//
//  TimerProxy.m
//  timerTest
//
//  Created by lbe on 2018/4/12.
//  Copyright © 2018年 liwuyang. All rights reserved.
//

#import "TimerProxy.h"

@implementation TimerProxy
{
    NSTimer *_timer;
    void (^_timerHandle)(void);
}

- (void)timerWithTimeInterval:(NSTimeInterval)ti selector:(void (^)(void))handle repeats:(BOOL)yesOrNo {
    _timerHandle = handle;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(timerFire:) userInfo:nil repeats:yesOrNo];
}

-(void)timerFire:(NSTimer *)timer {
    _timerHandle();
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

-(void)invalidate {
    [_timer invalidate];
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

@end
