//
//  MainNavgationBarView.h
//  科本
//
//  Created by 冯学杰 on 16/4/12.
//  Copyright © 2016年 无锡科本信息科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainNavgationBarView : UIView

-(id)initWithTitle:(NSString*)title;//初始化导航栏

@property (nonatomic , strong) UILabel *navTitleLabel;

@property (nonatomic , strong) UIButton *backButton;

@end
