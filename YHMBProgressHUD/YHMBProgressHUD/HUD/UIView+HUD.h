//
//  UIView+HUD.h
//  SCH
//
//  Created by SCH_YUH on 2016/11/25.
//  Copyright © 2016年 SCH_YUH. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HUDCustomView : UIView

@end
@interface UIView (HUD)
//配置HUD
+(void)setHUDErrorThemeColor:(UIColor *)color;
+(void)setHUDSuccThemeColor:(UIColor *)color;
+(void)setLoadCustomView:(HUDCustomView *)view;

///需要dismiss
- (void)showHUDHoldOn;

///dismiss
- (void)dismissHUD;
- (void)dismissHUDWithError:(NSString *)error;
- (void)dismissHUDWithSuccess:(NSString *)success;
- (void)dismissHUDWithSuccess:(NSString *)success animationComplete:(void (^ )())complete;
- (void)dismissHUDWithError:(NSString *)error animationComplete:(void (^ )())complete;



- (void)dismissHUDWithErrorDefult;
- (void)dismissHUDWithSuccessDefult;
- (void)dissmissHUDWithSuccMessage:(id )response;
- (void)dissmissHUDWithFailMessage:(id )response;

///showMessage
- (void)showHUD:(NSString *)message;
- (void)showHUD:(NSString *)message duration:(NSTimeInterval)duration;

///showError
- (void)showHUDWithError:(NSString *)error;
- (void)showHUDWithError:(NSString *)error duration:(NSTimeInterval)duration;
- (void)showHUDWithError:(NSString *)error animationComplete:(void (^ )())complete;
- (void)showHUDWithError:(NSString *)error duration:(NSTimeInterval)duration animationComplete:(void (^ )())complete;

///showSucc
- (void)showHUDWithSuccess:(NSString *)success;
- (void)showHUDWithSuccess:(NSString *)success duration:(NSTimeInterval)duration;
- (void)showHUDWithSuccess:(NSString *)success animationComplete:(void (^ )())complete;
- (void)showHUDWithSuccess:(NSString *)success duration:(NSTimeInterval)duration animationComplete:(void (^ )())complete;
@end
