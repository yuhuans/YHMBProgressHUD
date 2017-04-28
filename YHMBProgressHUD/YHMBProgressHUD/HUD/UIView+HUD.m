//
//  UIView+HUD.m
//  SCH
//
//  Created by SCH_YUH on 2016/11/25.
//  Copyright © 2016年 SCH_YUH. All rights reserved.
//

#import "UIView+HUD.h"
#import "HUDStateView.h"
#import <MBProgressHUD/MBProgressHUD.h>

#ifndef UIViewHUDHoldOnMessage
#define UIViewHUDHoldOnMessage @""
#endif

#ifndef UIViewHUDDismissDuration
#define UIViewHUDDismissDuration 1.5
#endif


@implementation HUDCustomView
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
    }
    return self;
}
-(CGSize)intrinsicContentSize{
    return self.frame.size;
}
@end
@implementation UIView (HUD)
static UIColor *succThemeColor = nil;
static UIColor *errorThemeColor = nil;
static HUDCustomView *loadCustomView = nil;

+(void)setHUDErrorThemeColor:(UIColor *)color{
    errorThemeColor=color;
}

+(void)setHUDSuccThemeColor:(UIColor *)color{
    succThemeColor=color;
}

+(void)setLoadCustomView:(HUDCustomView *)view{
    loadCustomView=view;
}
- (void)showHUDHoldOn{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = loadCustomView;
    hud.backgroundView.color=[UIColor clearColor];
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color=[UIColor clearColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
}
#pragma -mark -
#pragma -mark dismissHUD
- (void)dismissHUD{
    [MBProgressHUD hideHUDForView:self animated:YES];
}

- (void)dismissHUDWithError:(NSString *)error{
    [self dismissHUDWithError:error animationComplete:nil];
}

- (void)dismissHUDWithSuccess:(NSString *)success{
    [self dismissHUDWithSuccess:success animationComplete:nil];
}
-(void)dismissHUDWithSuccess:(NSString *)success animationComplete:(void (^)())complete{
    MBProgressHUD *hud  = [MBProgressHUD HUDForView:self];
    [UIView setMBProgressHUDWithHUD:hud withSucc:YES withDuration:UIViewHUDDismissDuration withShowStr:success animationComplete:complete];
}
-(void)dismissHUDWithError:(NSString *)error animationComplete:(void (^)())complete{
    MBProgressHUD *hud  = [MBProgressHUD HUDForView:self];
    [UIView setMBProgressHUDWithHUD:hud withSucc:NO withDuration:UIViewHUDDismissDuration withShowStr:error animationComplete:complete];
}
- (void)dismissHUDWithErrorDefult {
    [self dismissHUDWithError:NSLocalizedString(@"网络繁忙,请稍候再试！", @"HUD completed title")];
}

- (void)dismissHUDWithSuccessDefult {
    [self dismissHUDWithSuccess:nil];
    
}
- (void)dissmissHUDWithSuccMessage:(id )response{
    [self dismissHUDWithSuccess:@""];
}
- (void)dissmissHUDWithFailMessage:(id )response{
    [self dismissHUDWithError:@""];
}
#pragma -mark -
#pragma -mark showHUD
- (void)showHUD:(NSString *)message{
    [self showHUD:message duration:UIViewHUDDismissDuration];
}

- (void)showHUD:(NSString *)message duration:(NSTimeInterval)duration{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    
    // Set the text mode to show only text.
    hud.mode = MBProgressHUDModeText;
    hud.detailsLabel.text = NSLocalizedString(message, @"HUD message title");
    // Move to bottm center.
//    hud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    [hud hideAnimated:YES afterDelay:duration];
}
#pragma -mark -
#pragma -mark showHUDWithError
- (void)showHUDWithError:(NSString *)error{
    [self showHUDWithError:error animationComplete:nil];
}
- (void)showHUDWithError:(NSString *)error duration:(NSTimeInterval)duration{
    [self showHUDWithError:error duration:duration animationComplete:nil];
}
- (void)showHUDWithError:(NSString *)error animationComplete:(void (^ )())complete{
    [self showHUDWithError:error duration:UIViewHUDDismissDuration animationComplete:complete];
}
- (void)showHUDWithError:(NSString *)error duration:(NSTimeInterval)duration animationComplete:(void (^ )())complete{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [UIView setMBProgressHUDWithHUD:hud withSucc:NO withDuration:duration withShowStr:error animationComplete:complete];
}
#pragma -mark -
#pragma -mark showHUDWithSuccess
- (void)showHUDWithSuccess:(NSString *)success{
    [self showHUDWithSuccess:success animationComplete:nil];
}
- (void)showHUDWithSuccess:(NSString *)success duration:(NSTimeInterval)duration{
    [self showHUDWithSuccess:success duration:duration  animationComplete:nil];
}
- (void)showHUDWithSuccess:(NSString *)success animationComplete:(void (^ )())complete{
    [self showHUDWithSuccess:success duration:UIViewHUDDismissDuration  animationComplete:complete];
}
- (void)showHUDWithSuccess:(NSString *)success duration:(NSTimeInterval)duration animationComplete:(void (^ )())complete{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    [UIView setMBProgressHUDWithHUD:hud withSucc:YES withDuration:duration withShowStr:success animationComplete:complete];
}
#pragma -mark -
#pragma -mark load CutomView
+(void)setMBProgressHUDWithHUD:(MBProgressHUD *)hud
                      withSucc:(BOOL)isSucc
                  withDuration:(float)duration
                   withShowStr:(NSString *)showStr
              animationComplete:(void (^)())complete{
    hud.bezelView.layer.borderColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1].CGColor;
    hud.bezelView.layer.borderWidth = 1;
    hud.backgroundView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color=[UIColor whiteColor];
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    // Set the custom view mode to show any view.
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView=isSucc==YES ? [HUDStateView loadSuccHUDWithDuration:duration succThemeColor:succThemeColor animationComplete:complete] : [HUDStateView loadErrHUDWithDuration:duration errorThemeColor:errorThemeColor animationComplete:complete] ;
    // Optional label text.
    hud.detailsLabel.text = NSLocalizedString(showStr, @"HUD done title");
    [hud hideAnimated:YES afterDelay:duration];
}

@end


