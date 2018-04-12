//
//  TimerProxy.h
//  timerTest
//
//  Created by lbe on 2018/4/12.
//  Copyright © 2018年 liwuyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerProxy : NSObject

- (void)timerWithTimeInterval:(NSTimeInterval)ti selector:(void (^)(void))handle repeats:(BOOL)yesOrNo;

-(void)invalidate;

@end
