//
//  HomeViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "HomeViewController.h"
#import "RESideMenu.h"

@interface HomeViewController ()

@property (strong , nonatomic) HoneNavView *navView;

@property (strong, readonly, nonatomic) RESideMenu *sideMenuViewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navView];
}

-(HoneNavView *)navView{
    if (!_navView) {
        _navView = [[HoneNavView alloc]init];
        [self.view addSubview:_navView];
        _navView.sd_layout.topSpaceToView(self.view,0).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(64);
        [_navView.leftButton addTarget:self action:@selector(enterLeftVC) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _navView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (RESideMenu *)sideMenuViewController
{
    UIViewController *iter = self.parentViewController;
    while (iter) {
        if ([iter isKindOfClass:[RESideMenu class]]) {
            return (RESideMenu *)iter;
        } else if (iter.parentViewController && iter.parentViewController != iter) {
            iter = iter.parentViewController;
        } else {
            iter = nil;
        }
    }
    return nil;
}

-(void)enterLeftVC{
    [self sideMenuViewController];
    [self.sideMenuViewController presentLeftMenuViewController];
}

@end


@implementation HoneNavView

-(id)init{
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *bgView = [[UIImageView alloc]init];
        bgView.backgroundColor = LCHexColor(0x696C6F);
        bgView.alpha = 0.5;
        [self addSubview:bgView];
        bgView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0,0,0,0));
        
        self.leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.leftButton settitle:@"设置" titleColor:[UIColor whiteColor] font:14 image:nil];
        [self addSubview:self.leftButton];
        self.leftButton.sd_layout.leftSpaceToView(self,10).bottomSpaceToView(self,0).heightIs(44).widthIs(40);
        
        
        self.titleLabel = [UILabel setLabelTextColor:[UIColor whiteColor]  font:18];
        self.titleLabel.text = @"一起跑步吧！";
        [self addSubview:self.titleLabel];
        self.titleLabel.sd_layout.centerXEqualToView(self).bottomSpaceToView(self,13).heightIs(18);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:150];
        
    }
    return self;
}

@end

@implementation HoneBodyView{
    
}

-(id)init{
    
    if (self = [super init]) {
        
        self.distanceLabel = [UILabel setLabelTextColor:LCHexColor(0x29292E) font:30];
        
        self.runTimesLabel = [UILabel setLabelTextColor:LCHexColor(0x29292E) font:20];
        [self addSubview:self.runTimesLabel];
        self.runTimesLabel.sd_layout.centerYEqualToView(self).leftSpaceToView(self,30).heightIs(20);
        self.runTimesLabel.textAlignment = NSTextAlignmentCenter;
        [self.runTimesLabel setSingleLineAutoResizeWithMaxWidth:100];
    }
    return self;
}
//@property (nonatomic , strong) UILabel *distanceLabel;//跑步距离 总公里
//
//@property (nonatomic , strong) UILabel *runTimesLabel;//跑步次数
//
//@property (nonatomic , strong) UILabel *totalTimeLabel;//跑步时间 总
//
//@property (nonatomic , strong) UILabel *calorieLabel;//燃烧的卡路里 总
//
//@property (nonatomic , strong) UIButton *starRunButton;//开始跑步按钮

@end