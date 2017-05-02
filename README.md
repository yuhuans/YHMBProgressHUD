# YHMBProgressHUD
基于MBProgrssHUD再次封装

<img src="https://github.com/yuhuans/YHMBProgressHUD/blob/master/showError.gif" alt="btSimpleRippleButton Screenshot" width="208" height="369" /> . <img src="https://github.com/yuhuans/YHMBProgressHUD/blob/master/showHoldOn.gif" alt="btSimpleRippleButton Screenshot" width="208" height="369" /> . <img src="https://github.com/yuhuans/YHMBProgressHUD/blob/master/showSucc.gif" alt="btSimpleRippleButton Screenshot" width="208" height="369" />

## 使用说明

```
   //设置hud成功
    [UIView setHUDSuccThemeColor:[UIColor colorWithRed:39.0/255.0 green:198.0/255.0 blue:144.0/255.0 alpha:1]];
    //设置hud失败
    [UIView setHUDErrorThemeColor:[UIColor colorWithRed:198.0/255.0 green:91.0/255.0 blue:72.0/255.0 alpha:1]];
    //设置hud加载
    [UIView setLoadCustomView:[self loadView]];
```

### 自定义加载
 
```
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
```
 
