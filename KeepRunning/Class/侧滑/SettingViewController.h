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

@property (nonatomic , strong) UIImageView *userImgView;

@property (nonatomic , strong) UILabel *nameLabel;

@property (nonatomic , strong) UILabel *informationLabel;

@property (nonatomic , strong) UIButton *bgButton;

@end

@interface SettingTableViewCell : UITableViewCell

@property (nonatomic , strong) UILabel * myTitleLabel;

@property (nonatomic , strong) UIImageView *titleIconImageView;

@end