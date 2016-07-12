//
//  BaseNetWorkHelp.h
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/28.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RealReachability.h"
#import "MJExtension.h"

@interface BaseNetWorkHelp : NSObject

+(ReachabilityStatus)selectNetStatus;

@end
