//
//  HUDStateView.m
//  YJY
//
//  Created by apple on 26/4/17.
//  Copyright © 2017年 于欢. All rights reserved.
//

#import "HUDStateView.h"
#import "StateAnimationView.h"
#define HUDStateView_WIDTH 200
@interface HUDStateView ()
@property (nonatomic,strong)StateAnimationView *animationView;
@end
@implementation HUDStateView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        self.backgroundColor=[UIColor clearColor];
        self.animationView=[[StateAnimationView alloc]initWithFrame:CGRectMake(HUDStateView_WIDTH/2-40, 0, 80, 80)];
        self.animationView.animationComplete = ^{
            
        };
        [self addSubview:self.animationView];
    }
    return self;
}
-(void)animationStart{
    [self.animationView startCircleAnimation];
}
-(CGSize)intrinsicContentSize{
    return self.frame.size;
}
-(void)setState:(HUDState)state{
    _state=state;
    self.animationView.state=_state==HUDSucc ? AnimatioSucc :AnimatioError;
}
+(HUDStateView *)loadSuccHUDWithDuration:(float)duration succThemeColor:(UIColor *)themeColor  animationComplete:(void (^)())complete{
    HUDStateView *view=[[HUDStateView alloc]initWithFrame:CGRectMake(0, 0, HUDStateView_WIDTH, 80)];
    view.animationView.duration=duration;
    view.state=HUDSucc;
    view.animationView.themeColor=themeColor;
    view.animationView.animationComplete = complete;
    [view animationStart];
    return view;
}
+(HUDStateView *)loadErrHUDWithDuration:(float)duration errorThemeColor:(UIColor *)themeColor animationComplete:(void (^)())complete{
    HUDStateView *view=[[HUDStateView alloc]initWithFrame:CGRectMake(0, 0, HUDStateView_WIDTH, 80)];
    view.animationView.duration=duration;
    view.state=HUDError;
    view.animationView.themeColor=themeColor;
    view.animationView.animationComplete = complete;
    [view animationStart];
    return view;
}
@end
