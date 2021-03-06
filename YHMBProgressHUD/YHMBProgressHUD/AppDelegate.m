//
//  AppDelegate.m
//  YHMBProgressHUD
//
//  Created by apple on 28/4/17.
//  Copyright © 2017年 于欢. All rights reserved.
//

#import "AppDelegate.h"
#import "UIView+HUD.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //设置hud成功
    [UIView setHUDSuccThemeColor:[UIColor colorWithRed:39.0/255.0 green:198.0/255.0 blue:144.0/255.0 alpha:1]];
    //设置hud失败
    [UIView setHUDErrorThemeColor:[UIColor colorWithRed:198.0/255.0 green:91.0/255.0 blue:72.0/255.0 alpha:1]];
    //设置hud加载
    [UIView setLoadCustomView:[self loadView]];
    return YES;
}
-(HUDCustomView *)loadView{
    HUDCustomView *loadView=[[HUDCustomView alloc]initWithFrame:CGRectMake(0, 0, 120, 80)];
    loadView.backgroundColor=[UIColor clearColor];
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 120, 80)];
    label.text=@"加载中……";
    label.textColor=[UIColor whiteColor];
    label.textAlignment=NSTextAlignmentCenter;
    [loadView addSubview:label];
    return loadView;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
