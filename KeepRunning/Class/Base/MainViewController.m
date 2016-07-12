//
//  MainViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "MainViewController.h"
#import "RealReachability.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBg];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(networkChanged:)
                                                 name:kRealReachabilityChangedNotification
                                               object:nil];

}

- (void)networkChanged:(NSNotification *)notification
{
    RealReachability *reachability = (RealReachability *)notification.object;
    ReachabilityStatus status = [reachability currentReachabilityStatus];
    ReachabilityStatus previousStatus = [reachability previousReachabilityStatus];
    NSLog(@"networkChanged, currentStatus:%@, previousStatus:%@", @(status), @(previousStatus));
    
    if (status == RealStatusNotReachable)
    {
        [LCProgressHUD showMessage:@"网络无连接"];   // 网络无连接
    }
    
    if (status == RealStatusViaWiFi)
    {
         [LCProgressHUD showMessage:@"已切换至wifi环境"];   // wifi
    }
    
    if (status == RealStatusViaWWAN)
    {
        [LCProgressHUD showMessage:@"已切换至WWAN环境"];   // WWAN
    }
    
    WWANAccessType accessType = [GLobalRealReachability currentWWANtype];
    
    if (status == RealStatusViaWWAN)
    {
        if (accessType == WWANType2G)
        {
            [LCProgressHUD showMessage:@"当前2G网络"];   // 2G
        }
        else if (accessType == WWANType3G)
        {
            [LCProgressHUD showMessage:@"当前3G网络"];   // 3G
        }
        else if (accessType == WWANType4G)
        {
            [LCProgressHUD showMessage:@"当前4网络"];   // 4G
        }
        else
        {
            [LCProgressHUD showMessage:@"已切换至WWAN环境"];   // WWAN iOS6
        }
    }
    
    
}

-(void)setBg{
    
    UIImageView *bgImgV= [[UIImageView alloc]init];
    bgImgV.image = [UIImage imageNamed:@"bgImage"];
    bgImgV.alpha = 0.4;
    [self.view addSubview:bgImgV];
    bgImgV.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0,0,0,0));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
