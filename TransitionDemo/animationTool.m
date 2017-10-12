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
    
    
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:twoVC.view];
    
    [UIView animateWithDuration:5 animations:^{
        
        twoVC.view.alpha = 1.0;
        
        twoVC.view.transform = CGAffineTransformMakeScale(2, 2);
        
    } completion:^(BOOL finished) {
        
//        [UIView animateWithDuration:0.2 animations:^{
            twoVC.view.transform = CGAffineTransformIdentity;
//        } completion:^(BOOL finished) {
            [transitionContext completeTransition:YES];
//        }];
    
    }];
    
    
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
