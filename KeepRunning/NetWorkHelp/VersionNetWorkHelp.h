//
//  VersionNetWorkHelp.h
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/28.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "BaseNetWorkHelp.h"
#import "VersionModel.h"


@interface VersionNetWorkHelp : BaseNetWorkHelp

typedef void (^NetApiSelectVersionNetworkBlock)(NSString *versionId);

/**
 *  查询当前服务器版本号
 *
 *  @param block
 */
+(void)selectVersionBlock:(NetApiSelectVersionNetworkBlock)block;

@end
