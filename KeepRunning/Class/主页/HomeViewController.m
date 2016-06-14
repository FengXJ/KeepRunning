//
//  HomeViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "HomeViewController.h"
#import "RESideMenu.h"
#import "ReadyViewController.h"


@interface HomeViewController ()

@property (strong , nonatomic) HoneNavView *navView;

@property (strong , nonatomic) HoneBodyView *bodyView;

@property (strong, readonly, nonatomic) RESideMenu *sideMenuViewController;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bodyView];
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

-(HoneBodyView *)bodyView{
    if (!_bodyView) {
        _bodyView = [[HoneBodyView alloc]init];
        [self.view addSubview:_bodyView];
        _bodyView.sd_layout.topSpaceToView(self.view,0).rightEqualToView(self.view).leftEqualToView(self.view).bottomEqualToView(self.view);
    }
    
    _bodyView.runTimesLabel.text = @"0";
    _bodyView.totalTimeLabel.text = @"<1";
    _bodyView.calorieLabel.text = @"0";
    [_bodyView.starRunButton addTarget:self action:@selector(enterRunningVC) forControlEvents:UIControlEventTouchUpInside];
    
    return _bodyView;
}

-(void)enterRunningVC{
    ReadyViewController *runVC = [[ReadyViewController alloc]init];
    [self.navigationController pushViewController:runVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//侧滑
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
        [self.titleLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:18]];
        self.titleLabel.text = @"一起跑步吧！";
        [self addSubview:self.titleLabel];
        self.titleLabel.sd_layout.centerXEqualToView(self).bottomSpaceToView(self,13).heightIs(18);
        [self.titleLabel setSingleLineAutoResizeWithMaxWidth:150];
        
    }
    return self;
}

@end

@implementation HoneBodyView{
    UILabel *runTimesTitleLabel;
    UILabel *totalTimeTitleLabel;
    UILabel *calorieTitleLabel;
    UILabel *distanceTitleLabel;
    
    UIImageView *firstLineImageView;
    UIImageView *secondLineImageView;
}

-(id)init{
    
    if (self = [super init]) {
        
        self.runTimesLabel = [UILabel setLabelTextColor:LCHexColor(0x393940) font:40];
        [self.runTimesLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
        [self addSubview:self.runTimesLabel];
        self.runTimesLabel.sd_layout.centerYEqualToView(self).leftSpaceToView(self,60).heightIs(40);
        [self.runTimesLabel setSingleLineAutoResizeWithMaxWidth:200];
        
        runTimesTitleLabel = [UILabel setLabelTextColor:LCHexColor(0xA8A9A8) font:15];
        [runTimesTitleLabel  setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        runTimesTitleLabel.text = @"总次数";
        [self addSubview:runTimesTitleLabel];
        runTimesTitleLabel.sd_layout.centerXEqualToView(_runTimesLabel).topSpaceToView(_runTimesLabel,10).heightIs(15);
        [runTimesTitleLabel setSingleLineAutoResizeWithMaxWidth:100];
        
        self.totalTimeLabel = [UILabel setLabelTextColor:LCHexColor(0x393940) font:40];
        [self.totalTimeLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
        [self addSubview:self.totalTimeLabel];
        self.totalTimeLabel.sd_layout.centerYEqualToView(self).centerXEqualToView(self).heightIs(40);
        [self.totalTimeLabel setSingleLineAutoResizeWithMaxWidth:200];
        
        totalTimeTitleLabel = [UILabel setLabelTextColor:LCHexColor(0xA8A9A8) font:15];
        [totalTimeTitleLabel  setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        totalTimeTitleLabel.text = @"总时长(h)";
        [self addSubview:totalTimeTitleLabel];
        totalTimeTitleLabel.sd_layout.centerXEqualToView(_totalTimeLabel).topSpaceToView(_totalTimeLabel,10).heightIs(15);
        [totalTimeTitleLabel setSingleLineAutoResizeWithMaxWidth:150];
        
        self.calorieLabel = [UILabel setLabelTextColor:LCHexColor(0x393940) font:40];
        [self.calorieLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:40]];
        [self addSubview:self.calorieLabel];
        self.calorieLabel.sd_layout.centerYEqualToView(self).rightSpaceToView(self,60).heightIs(40);
        [self.calorieLabel setSingleLineAutoResizeWithMaxWidth:200];
        
        calorieTitleLabel = [UILabel setLabelTextColor:LCHexColor(0xA8A9A8) font:15];
        [calorieTitleLabel  setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15]];
        calorieTitleLabel.text = @"卡路里(千卡)";
        [self addSubview:calorieTitleLabel];
        calorieTitleLabel.sd_layout.centerXEqualToView(_calorieLabel).topSpaceToView(_calorieLabel,10).heightIs(15);
        [calorieTitleLabel setSingleLineAutoResizeWithMaxWidth:200];
        
        firstLineImageView = [[UIImageView alloc]init];
        firstLineImageView.backgroundColor = LINECOLOR;
        [self addSubview:firstLineImageView];
        firstLineImageView.sd_layout.leftSpaceToView(self,15).rightSpaceToView(self,15).bottomSpaceToView(_runTimesLabel,15).heightIs(0.5);
        
        secondLineImageView = [[UIImageView alloc]init];
        secondLineImageView.backgroundColor = LINECOLOR;
        [self addSubview:secondLineImageView];
        secondLineImageView.sd_layout.leftSpaceToView(self,15).rightSpaceToView(self,15).topSpaceToView(totalTimeTitleLabel,15).heightIs(0.5);
        
        distanceTitleLabel = [UILabel setLabelTextColor:LCHexColor(0xA8A9A8) font:30];
        [distanceTitleLabel  setFont:[UIFont fontWithName:@"Helvetica-Bold" size:30]];
        distanceTitleLabel.text = @"总公里";
        [self addSubview:distanceTitleLabel];
        distanceTitleLabel.sd_layout.centerXEqualToView(self).bottomSpaceToView(firstLineImageView,20).heightIs(30);
        [distanceTitleLabel setSingleLineAutoResizeWithMaxWidth:100];
        
        self.distanceLabel = [UILabel setLabelTextColor:LCHexColor(0x29292E) font:80];
        [self.distanceLabel  setFont:[UIFont fontWithName:@"Helvetica-Bold" size:80]];
        self.distanceLabel.text = @"0";
        [self addSubview:self.distanceLabel];
        self.distanceLabel.sd_layout.centerXEqualToView(self).bottomSpaceToView(distanceTitleLabel,20).heightIs(80);
        [self.distanceLabel setSingleLineAutoResizeWithMaxWidth:320];
        
        self.starRunButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.starRunButton settitle:@"开始跑步" titleColor:[UIColor whiteColor] font:30 image:nil];
        self.starRunButton.backgroundColor = LCHexColor(0x696C6F);
        [self addSubview:self.starRunButton];
        self.starRunButton.sd_layout.leftEqualToView(self).rightEqualToView(self).bottomEqualToView(self).heightIs(70);
        
        
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