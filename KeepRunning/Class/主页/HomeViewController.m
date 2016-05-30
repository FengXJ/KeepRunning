//
//  HomeViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@property (strong , nonatomic)HoneNavView *navView;

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
    }
    return _navView;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
        self.leftButton.sd_layout.leftSpaceToView(self,15).bottomSpaceToView(self,13).heightIs(18).widthIs(40);
        
        
        self.titleLabel = [UILabel setLabelTextColor:[UIColor whiteColor]  font:18];
        self.titleLabel.text = @"一起跑步吧！";
        [self addSubview:self.titleLabel];
        self.titleLabel.sd_layout.centerXEqualToView(self).bottomSpaceToView(self,13).heightIs(18);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:150];
        
    }
    return self;
}

@end