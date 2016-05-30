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