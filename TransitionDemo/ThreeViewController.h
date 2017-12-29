//
//  ThreeViewController.h
//  TransitionDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^myBlock)(void);
@interface ThreeViewController : UIViewController

@property (nonatomic, copy) myBlock completeBlock;

@end
