//
//  SettingViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong , nonatomic) UITableView * bodyTableView;

@property (strong , nonatomic) SettingHeadView *headView;

@property (strong , nonatomic) NSArray *titleArr;

@property (strong , nonatomic) NSArray *iconArr;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = LCHexColor(0x484A4C);
    _titleArr = @[@"我的资料",@"跑步记录",@"我的成就",@"设置中心",@"安全中心",@"关于我们",@"退出登录"];
    _iconArr = @[@"userCenter_icon",@"runRecond_icon",@"userMedal_icon",@"userSetting_icon",@"saveCenter_icon",@"aboutUs_icon",@"userEsc_icon"];
    
    [self bodyTableView];
    [self headView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)bodyTableView{
    if (!_bodyTableView) {
        _bodyTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _bodyTableView.dataSource = self;
        _bodyTableView.delegate = self;
        self.bodyTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.bodyTableView.scrollEnabled = NO;
        _bodyTableView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_bodyTableView];
        [self setExtraCellLineHidden:_bodyTableView];
        _bodyTableView.sd_layout.leftEqualToView(self.view).rightSpaceToView(self.view,90).centerYEqualToView(self.view).bottomSpaceToView(self.view,0);
        
    }
    return _bodyTableView;
}

-(SettingHeadView *)headView{
    if (!_headView) {
        _headView = [[SettingHeadView alloc]init];
        [self.view addSubview:_headView];
        _headView.informationLabel.text = @"这可以自动适应的哟这可以自动适应的哟这可以自动适应的哟这可以自动适应的哟";
        _headView.sd_layout.bottomSpaceToView(_bodyTableView,0).leftEqualToView(self.view).rightSpaceToView(self.view,120);
        [_headView.bgButton addTarget:self action:@selector(loginOrEnterPersonVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _headView;
}

-(void)loginOrEnterPersonVC{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    [self presentViewController:loginVC animated: YES completion:nil];
}
#pragma mark - tableviewDelegata
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *ID = @"test";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[SettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.myTitleLabel.text = _titleArr [indexPath.row];
    cell.titleIconImageView.image = [UIImage imageNamed:_iconArr[indexPath.row]];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 55;
}

- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}
// 隐藏多余cell

-(void)setExtraCellLineHidden: (UITableView *)tableView
{
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor clearColor];
    
    [tableView setTableFooterView:view];
}

@end

@implementation SettingHeadView

-(id)init{
    if (self = [super init]) {
        
        _userImgView = [[UIImageView alloc]init];
        UIImage *image =[UIImage imageNamed:@"头像"] ;
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        _userImgView.image = image;
        [self addSubview:_userImgView];
        _userImgView.sd_layout.leftSpaceToView(self,15).centerYEqualToView(self).heightIs(60).widthIs(60);
        _userImgView.sd_cornerRadiusFromHeightRatio = @(0.5);
        
        _nameLabel = [UILabel setLabelTextColor:[UIColor whiteColor] font:15];
        _nameLabel.text = @"请登录/注册";
        [self addSubview:_nameLabel];
        _nameLabel.sd_layout.leftSpaceToView(_userImgView,10).topSpaceToView(self,10).heightIs(15);
        [_nameLabel setSingleLineAutoResizeWithMaxWidth:320];
        
        _informationLabel = [UILabel setLabelTextColor:[UIColor whiteColor] font:13];
        [self addSubview:_informationLabel];
        _informationLabel.sd_layout.topSpaceToView(_nameLabel,10).leftEqualToView(_nameLabel).rightSpaceToView(self,0).autoHeightRatio(0);
        
        [self setupAutoHeightWithBottomView:_informationLabel bottomMargin:10];
        
        _bgButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self addSubview:_bgButton];
        _bgButton.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0,0,0,0));
        
    }
    return self;
}

@end

@implementation SettingTableViewCell{
    UIImageView *lineImageView;
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if ([super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        self.backgroundColor = [UIColor clearColor];
        
        lineImageView = [[UIImageView alloc]init];
        [self addSubview:lineImageView];
        lineImageView.backgroundColor = LINECOLOR;
        lineImageView.sd_layout.topSpaceToView(self,0).heightIs(0.5).leftEqualToView(self).rightEqualToView(self);
        
        _titleIconImageView = [[UIImageView alloc]init];
        _titleIconImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_titleIconImageView];
        _titleIconImageView.sd_layout.leftSpaceToView(self.contentView,33).centerYEqualToView(self.contentView).widthIs(25).heightIs(25);
        
        _myTitleLabel = [UILabel setLabelTextColor:LCHexColor(0xffffff) font:16];
        [self.contentView addSubview:_myTitleLabel];
        _myTitleLabel.sd_layout.leftSpaceToView(self.contentView,85).centerYEqualToView(self.contentView).heightIs(16).widthIs(100);
        
    }

    return self;
}

@end