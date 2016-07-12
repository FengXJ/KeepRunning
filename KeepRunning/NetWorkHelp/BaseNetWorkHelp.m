//
//  BaseNetWorkHelp.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/28.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "BaseNetWorkHelp.h"

@implementation BaseNetWorkHelp

+(ReachabilityStatus)selectNetStatus{
    
    ReachabilityStatus status = [GLobalRealReachability currentReachabilityStatus];
    NSLog(@"Initial reachability status:%@",@(status));
    
    if (status == RealStatusNotReachable)
    {
//         = @"Network unreachable!";
    }
    
    if (status == RealStatusViaWiFi)
    {
//         = @"Network wifi! Free!";
    }
    
    if (status == RealStatusViaWWAN)
    {
//         = @"Network WWAN! In charge!";
    }
    return status;
}
@end
