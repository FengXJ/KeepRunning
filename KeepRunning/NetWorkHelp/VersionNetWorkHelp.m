//
//  VersionNetWorkHelp.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/28.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "VersionNetWorkHelp.h"

@implementation VersionNetWorkHelp

/**
 *  查询服务器版本号
 *
 *  @param block
 */
+(void)selectVersionBlock:(NetApiSelectVersionNetworkBlock)block{
    //先检测网络状态
    if ([BaseNetWorkHelp selectNetStatus] != RealStatusNotReachable) {
        /**
         *  网络无问题,开始请求
         */
        AVQuery *query = [AVQuery queryWithClassName:@"Version"];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if (error) {
                NSLog(@"%@",error);
            }else{
                if (objects.count!=0) {
                    AVObject *avobj = [objects firstObject];
                    VersionReturn *returnModel = [[VersionReturn alloc]init];
                    returnModel.versionNumber = [avobj valueForKey:@"versionNumber"];
                    block(returnModel.versionNumber);
                }
            }
        }];

    }else{
        //网络不稳定
        [LCProgressHUD showFailure:@"请求失败,请检查网络状况"];
    }
    
}




@end
