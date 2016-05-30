//
//  HomeViewController.h
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "MainViewController.h"

@interface HomeViewController : MainViewController

@end

/**
 *  navView
 */
@interface HoneNavView : UIView

@property (nonatomic , strong) UIButton *leftButton;

@property (nonatomic , strong) UILabel *titleLabel;

@end

/**
 *  中间部分
 */
@interface HoneBodyView : UIView

@property (nonatomic , strong) UILabel *distanceLabel;//跑步距离 总公里

@property (nonatomic , strong) UILabel *runTimesLabel;//跑步次数

@property (nonatomic , strong) UILabel *totalTimeLabel;//跑步时间 总

@property (nonatomic , strong) UILabel *calorieLabel;//燃烧的卡路里 总

@property (nonatomic , strong) UIButton *starRunButton;//开始跑步按钮

@end