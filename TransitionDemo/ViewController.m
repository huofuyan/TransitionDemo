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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeContactAdd];
    
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
}

- (void)click {
    
    TwoViewController *twoVC = [[TwoViewController alloc] init];
    
    
    
    [self presentViewController:twoVC animated:YES completion:^{
        
        
        
    }];
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
