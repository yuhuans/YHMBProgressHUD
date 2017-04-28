//
//  HUDStateView.h
//  YJY
//
//  Created by apple on 26/4/17.
//  Copyright © 2017年 于欢. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum HUDState {
    HUDSucc  = 0,
    HUDError
}HUDState;
@interface HUDStateView : UIView
@property (nonatomic,assign)HUDState state;
+(HUDStateView *)loadSuccHUDWithDuration:(float)duration succThemeColor:(UIColor *)themeColor animationComplete:(void (^ )())complete;
+(HUDStateView *)loadErrHUDWithDuration:(float)duration errorThemeColor:(UIColor *)themeColor  animationComplete:(void (^ )())complete;;
@end
