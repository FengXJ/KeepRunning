//
//  VersionModel.h
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/28.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>

@interface VersionModel : NSObject

@end

@interface VersionReturn : NSObject

@property (strong , nonatomic) NSString *versionNumber;//版本号
@end
