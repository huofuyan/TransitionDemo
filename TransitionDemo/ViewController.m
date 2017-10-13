//
//  ViewController.m
//  TransitionDemo
//
//  Created by apple on 2017/10/12.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"
#import "TwoViewController.h"
#import "animationTool.h"

@interface ViewController ()

@property (nonatomic, strong) UIView* demoView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    
    CABasicAnimation *anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anim.toValue = @(2 * M_PI);
    
    anim.repeatCount = MAXFLOAT;
    anim.duration = 2;
    
    [button.layer addAnimation:anim forKey:nil];
    
}

- (void)animWithPath {
    
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 200, 200)];
    anim.path = path.CGPath;
    anim.repeatCount = MAXFLOAT;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    // 设置计算模式
    anim.calculationMode = kCAAnimationPaced;
    // 设置旋转模式
    anim.rotationMode = kCAAnimationRotateAuto;
    
    anim.duration = 2.0;
    
    [_demoView.layer addAnimation:anim forKey:nil];
}

- (void)click {
    
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    
    twoVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
    [self presentViewController:twoVC animated:YES completion:^{
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
