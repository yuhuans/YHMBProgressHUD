//
//  StateAnimationView.m
//  AnimationDemo
//
//  Created by apple on 25/4/17.
//  Copyright © 2017年 于欢. All rights reserved.
//

#import "StateAnimationView.h"
@interface StateAnimationView ()<CAAnimationDelegate>
{
    CAShapeLayer *shapeLayer;
}
@end
@implementation StateAnimationView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _themeColor=[UIColor blackColor];
        _duration=3.0;
    }
    return self;
}
-(void)setUp{
    switch (self.state) {
        case AnimatioSucc:
            [self createSucc];
            break;
        case AnimatioError:
            [self createErro];
            break;
        default:
            break;
    }
}
-(void)createSucc{
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);//圆心
    float radius = 30;//半径
    UIBezierPath *path=[self createCircleWithRadius:radius withCenter:center];
    //对勾路径
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    [linePath moveToPoint:CGPointMake(center.x - radius +10, center.y)];
    [linePath addLineToPoint:CGPointMake(center.x-5, center.y+20)];
    [linePath addLineToPoint:CGPointMake(center.x + radius - 12, center.y - 15)];
    [UIColor.blackColor setStroke];
    //拼接两个路径
    [path appendPath:linePath];
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = _themeColor.CGColor;//线条颜色
    shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色
    shapeLayer.lineWidth = 1.5;
    shapeLayer.strokeStart = 0.0;
    shapeLayer.strokeEnd = 0.0;
    [self.layer addSublayer:shapeLayer];
}
-(void)createErro{
    CGPoint center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);//圆心
    float radius = 30;//半径
    UIBezierPath *path=[self createCircleWithRadius:radius withCenter:center];
    //叉叉路径1
    UIBezierPath *linePath1 = [UIBezierPath bezierPath];
    [linePath1 moveToPoint:CGPointMake(center.x - radius +15, center.y - radius+15)];
    [linePath1 addLineToPoint:CGPointMake(center.x+radius-15, center.y+radius-15)];
    [UIColor.blackColor setStroke];
    //拼接路径
    [path appendPath:linePath1];
    //叉叉路径2
    UIBezierPath *linePath2 = [UIBezierPath bezierPath];
    [linePath2 moveToPoint:CGPointMake(center.x+radius-15, center.y-radius+15)];
    [linePath2 addLineToPoint:CGPointMake(center.x - radius +15, center.y + radius-15)];
    [UIColor.blackColor setStroke];
    //拼接路径
    [path appendPath:linePath2];

    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = _themeColor.CGColor;//线条颜色
    shapeLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色
    shapeLayer.lineWidth = 1.5;
    shapeLayer.strokeStart = 0.0;
    shapeLayer.strokeEnd = 0.0;
    [self.layer addSublayer:shapeLayer];
}
-(UIBezierPath *)createCircleWithRadius:(float)radius withCenter:(CGPoint)center{
    //圆圈路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:M_PI * 3 / 2 endAngle:M_PI * 7 / 2 clockwise:YES];//顺时针绘制
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineCapRound; //终点处理
    return path;
}
- (void)startCircleAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    if (shapeLayer.strokeEnd == 1.0)
    {
        [animation setFromValue:@1.0];
        [animation setToValue:@0.0];
    }
    else
    {
        [animation setFromValue:@0.0];
        [animation setToValue:@1.0];
    }
    
    [animation setDuration:_duration];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;//当动画结束后,layer会一直保持着动画最后的状态
    animation.delegate = self;
    [shapeLayer addAnimation:animation forKey:@"Circle"];
}


#pragma -mark CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    if (flag)
    {
        if (shapeLayer.strokeEnd == 0.0)
        {
            //加载完成
            shapeLayer.strokeEnd = 1.0;
        }
        else
        {
            //还原完成
            shapeLayer.strokeEnd = 0.0;
            
        }
    }
    
    if (self.animationComplete!=nil) {
        self.animationComplete();
    }
}
#pragma -mark 
#pragma -mark setter 
-(void)setState:(AnimatioState)state{
    _state=state;
    [self setUp];
}
-(void)setThemeColor:(UIColor *)themeColor{
    _themeColor=themeColor;
    shapeLayer.strokeColor = _themeColor.CGColor;//线条颜色
}
-(void)setDuration:(NSTimeInterval)duration{
    _duration=duration;
}
@end
