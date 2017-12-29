//
//  DemoView.m
//  TransitionDemo
//
//  Created by apple on 2017/12/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "DemoView.h"

#define WIDTH self.frame.size.width

#define HEIGHT self.frame.size.height

@interface DemoView()<CAAnimationDelegate>

@property (nonatomic, strong) UIView    *AnimatView;

@property (nonatomic , strong) UIBezierPath *pathRight;

@property (nonatomic, strong) UIBezierPath *pathLeft;

@property (nonatomic, strong) UIView *viewRight;
@end


@implementation DemoView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupUI];
    }
    return  self;
    
}

- (void)setupUI {
    
    [self addSubview:self.AnimatView];
    
    [self addSubview:self.viewRight];
    
    
    
//    self.AnimatView.layer.
    
//    self.AnimatView
    
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    NSLog(@"AnimatVIew---%f,%f",self.AnimatView.center.x,self.AnimatView.center.y);
    
    id centerold = [change objectForKey:NSKeyValueChangeOldKey];
    
    NSLog(@"old-----%@",centerold);
    
    id centerNew = [change objectForKey:NSKeyValueChangeNewKey];
    
    NSLog(@"new-----%@",centerNew);
    
    
    
    
    
    
   
    
}

- (void)drawRect:(CGRect)rect {
    
    UIColor *color = [UIColor redColor];
    
    [color set];
    [self demo2];
    
    [self demo3];
    
    //
    //    path addQuadCurveToPoint:<#(CGPoint)#> controlPoint:<#(CGPoint)#>
    
    
    
}

- (void)demo3 {
    
    UIBezierPath *path = [UIBezierPath bezierPath] ;
    
    [path moveToPoint:CGPointMake(WIDTH, 0)];
    
    path.lineWidth = 5;
    
//    path addCurveToPoint:<#(CGPoint)#> controlPoint1:<#(CGPoint)#> controlPoint2:<#(CGPoint)#>
    
    [path addQuadCurveToPoint:CGPointMake(0, HEIGHT) controlPoint:CGPointMake(400, 350)];
    
    [[UIColor redColor] setStroke];
    
    [path stroke];
    
}

- (UIView *)viewRight {
    
    if (!_viewRight) {
        
        _viewRight = [[UIView alloc] initWithFrame:CGRectMake(WIDTH - 50, 0, 50, 50)];
        
        _viewRight.backgroundColor = [UIColor blackColor];
        
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
        
        //一开始慢 渐渐变快
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        
        [animation addObserver:self forKeyPath:@"position" options:NSKeyValueObservingOptionNew context:nil];
        
        
        
        //重复
        animation.repeatCount = MAXFLOAT;
        
        animation.duration = 5;
        
        animation.delegate = self;
        
        animation.autoreverses = YES;
        
        //动画路径
        animation.path = self.pathRight.CGPath;
        
        [_viewRight.layer addAnimation:animation forKey:nil];
        
        
    }
    
    return _viewRight;
}

- (UIView *)AnimatView {
    
    if (!_AnimatView) {
        _AnimatView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        
        _AnimatView.backgroundColor = [UIColor orangeColor];
        
        CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
        
        animation.keyPath = @"position";
        
        animation.path= self.pathLeft.CGPath;
        
        animation.repeatCount=MAXFLOAT;
        
        animation.removedOnCompletion = NO;
        
        animation.fillMode = kCAFillModeForwards;
        
        animation.duration = 4.0f;
        
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        
        animation.delegate=self;
        
        animation.autoreverses = YES;
        
        [_AnimatView.layer addAnimation:animation forKey:nil];
        
    }
    return _AnimatView;

}


- (void)demo2 {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:CGPointMake(0, 0)];
    
    path.lineWidth = 5;
    
    [path addQuadCurveToPoint:CGPointMake(self.frame.size.width, self.frame.size.height) controlPoint:CGPointMake(200, 130)];
    
    self.pathLeft = path;
    
    [path stroke];
    
    
}

- (UIBezierPath *)pathLeft {
    if (!_pathLeft) {
        
        _pathLeft = [UIBezierPath bezierPath];
        
        [_pathLeft moveToPoint:CGPointMake(0, 0)];
        
        _pathLeft.lineWidth = 5;
        
        [_pathLeft addQuadCurveToPoint:CGPointMake(self.frame.size.width, self.frame.size.height) controlPoint:CGPointMake(200, 130)];
        
    }
    return _pathLeft;
}
- (UIBezierPath *)pathRight {
    
    if (!_pathRight) {
        
        _pathRight = [UIBezierPath bezierPath] ;
        
        [_pathRight moveToPoint:CGPointMake(WIDTH, 0)];
        
        _pathRight.lineWidth = 5;
        
        //    path addCurveToPoint:<#(CGPoint)#> controlPoint1:<#(CGPoint)#> controlPoint2:<#(CGPoint)#>
        
        [_pathRight addQuadCurveToPoint:CGPointMake(0, HEIGHT) controlPoint:CGPointMake(400, 350)];
        
        [[UIColor redColor] setStroke];
        
    }
    return _pathRight;
}

- (void)demo1 {
    
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:self.center radius:80 startAngle:0 endAngle:M_PI clockwise:YES];
    
    path.lineWidth = 5;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineJoinRound;
    
    [path stroke];
}

-(void)pauseLayer:(CALayer*)layer
{
    CFTimeInterval pausedTime = [layer convertTime:CACurrentMediaTime() fromLayer:nil];
    layer.speed = 0.0;
    layer.timeOffset = pausedTime;
}

@end
