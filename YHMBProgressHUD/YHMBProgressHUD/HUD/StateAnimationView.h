//
//  StateAnimationView.h
//  AnimationDemo
//
//  Created by apple on 25/4/17.
//  Copyright © 2017年 于欢. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum AnimatioState {
    AnimatioSucc  = 0,
    AnimatioError
}AnimatioState;
@interface StateAnimationView : UIView
-(void)startCircleAnimation;
@property (nonatomic,assign)AnimatioState state;
@property (nonatomic,strong)UIColor *themeColor;
@property (nonatomic,assign)NSTimeInterval duration;
@property (nonatomic, copy) void (^animationComplete)();
@end
