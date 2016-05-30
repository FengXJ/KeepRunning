//
//  SettingViewController.h
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "MainViewController.h"

@interface SettingViewController : MainViewController

@end

/**
 *  headView 登录或注册 头像部分
 */
@interface SettingHeadView : UIView

@property (nonatomic , strong) UIButton *userImgButton;

@property (nonatomic , strong) UILabel *nameLabel;

@property (nonatomic , strong) UILabel *informationLabel;

@end