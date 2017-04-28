//
//  ViewController.m
//  YHMBProgressHUD
//
//  Created by apple on 28/4/17.
//  Copyright © 2017年 于欢. All rights reserved.
//

#import "ViewController.h"
#import "UIView+HUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showHoldOn:(id)sender {
    [self.view showHUDHoldOn];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2. * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.view dismissHUDWithSuccess:@"成功"];
    });
}
- (IBAction)showSucc:(id)sender {
    [self.view showHUDWithSuccess:@"成功"];
}
- (IBAction)showError:(id)sender {
    [self.view showHUDWithError:@"失败"];
}


@end
