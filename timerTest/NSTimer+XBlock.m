//
//  NSTimer+XBlock.m
//  timerTest
//
//  Created by lbe on 2018/4/12.
//  Copyright © 2018年 liwuyang. All rights reserved.
//

#import "NSTimer+XBlock.h"

@implementation NSTimer (XBlock)
- (instancetype)initWithFireDate:(NSDate *)date interval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(void))block
{
    return [self initWithFireDate:date interval:seconds target:self.class selector:@selector(runBlock:) userInfo:block repeats:repeats];
}

+ (NSTimer *)xxxxscheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(void))block
{
    return [self scheduledTimerWithTimeInterval:seconds target:self selector:@selector(runBlock:) userInfo:block repeats:repeats];
}

+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(void))block
{
    return [self timerWithTimeInterval:seconds target:self selector:@selector(runBlock:) userInfo:block repeats:repeats];
}

#pragma mark - Private methods

+ (void)runBlock:(NSTimer *)timer
{
    if ([timer.userInfo isKindOfClass:NSClassFromString(@"NSBlock")])
    {
        void (^block)(void) = timer.userInfo;
        block();
    }
}

@end
