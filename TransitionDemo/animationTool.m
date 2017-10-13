//
//  animationTool.m
//  TransitionDemo
//
//  Created by apple on 2017/10/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "animationTool.h"
#import <UIKit/UIKit.h>
#import "TwoViewController.h"
@implementation animationTool


- (instancetype)init {
    self = [super init];

    return self;
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    ;
    TwoViewController *twoVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    twoVC.view.center = [UIApplication sharedApplication].keyWindow.center;
    
    twoVC.alertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    
    UIView *containerView = [transitionContext containerView];
    
//    containerView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.1];
    containerView.backgroundColor = [UIColor clearColor];
    
    [containerView addSubview:twoVC.view];
    
    [UIView animateWithDuration:5 animations:^{
        
        twoVC.view.alpha = 1.0;
        
        twoVC.alertView.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(BOOL finished) {
        
        [UIView animateWithDuration:5 animations:^{
            twoVC.alertView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
        }];
    
    }];
    
}
- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
