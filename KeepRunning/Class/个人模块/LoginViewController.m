//
//  LoginViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/6/20.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "LoginViewController.h"
#import "MainNavgationBarView.h"

@interface LoginViewController ()

@property (nonatomic , strong) UITextField *phoneTextField;//手机号

@property (nonatomic , strong) UITextField *pwdTextField;//密码

@property (nonatomic , strong) UIButton *loginButton;//登录按钮

@property (nonatomic , strong) UIButton *registerButton;//注册按钮

@property (nonatomic , strong) UIButton *findPwdButton;//忘记密码按钮

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createNav];
    [self createTextField];
    [self createButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//创建导航栏
-(void)createNav{
    MainNavgationBarView *navView = [[MainNavgationBarView alloc]initWithTitle:@"登录"];
    
    navView.backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    navView.backButton.frame = CGRectMake(0,20,40,48);
    navView.backButton.backgroundColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:@"back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [navView.backButton setImage:image forState:UIControlStateNormal];
    [navView.backButton setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0,0)];
    [navView addSubview:navView.backButton];
    
    navView.backgroundColor = LCHexColor(0x696C6F);
    navView.navTitleLabel.text = @"登录";
    navView.navTitleLabel.textColor = [UIColor whiteColor];
    [navView.backButton addTarget:self action:@selector(backToSeting) forControlEvents:UIControlEventTouchUpInside];
    navView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 68);
    [self.view addSubview:navView];
}

//创建2个textField 其实可以写一个View 但是我懒得算了。 直接创建2个可以用centerYEqualToView
-(void)createTextField{
    UIView *phoneBGView = [[UIView alloc]init];
    [self.view addSubview:phoneBGView];
    
    self.phoneTextField = [[UITextField alloc]init];
    self.phoneTextField.placeholder = @"请输入手机号";
    self.phoneTextField.tintColor = [UIColor blackColor];
    self.pwdTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [self.phoneTextField setBorderStyle:UITextBorderStyleRoundedRect];
    [phoneBGView addSubview:self.phoneTextField];
    
    phoneBGView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.view,15+68).heightIs(50);
    self.phoneTextField.sd_layout.leftSpaceToView(phoneBGView,25).rightSpaceToView(phoneBGView,25).centerYEqualToView(phoneBGView).heightIs(40);
    
    UIImageView *lineImageView = [[UIImageView alloc]init];
    lineImageView.backgroundColor = LCHexColor(0xb3b3b3);
    [self.view addSubview:lineImageView];
    
    lineImageView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(phoneBGView,0).heightIs(0.5);
    
    UIView *pwdBGView = [[UIView alloc]init];
    [self.view addSubview:pwdBGView];
    
    self.pwdTextField = [[UITextField alloc]init];
    self.pwdTextField.placeholder = @"请输入登录密码";
    [self.pwdTextField setSecureTextEntry:YES];
    self.pwdTextField.tintColor = [UIColor blackColor];
    [self.pwdTextField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [pwdBGView addSubview:self.pwdTextField];
    pwdBGView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(lineImageView,0).heightIs(50);
    self.pwdTextField.sd_layout.leftSpaceToView(pwdBGView,25).rightSpaceToView(pwdBGView,25).centerYEqualToView(pwdBGView).heightIs(40);
    
}
//创建3个按钮
-(void)createButton{
    self.loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.loginButton settitle:@"登录" titleColor:[UIColor whiteColor] font:14 image:nil];
    self.loginButton.backgroundColor = LCHexColor(0x696C6F);
    [self.loginButton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    
    UIImageView *lineImageView = [[UIImageView alloc]init];
    lineImageView.image = [UIImage imageNamed:@"分隔虚线"];
    [self.view addSubview:lineImageView];
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.registerButton settitle:@"快速注册" titleColor:LCHexColor(0x696C6F) font:12 image:nil];
    [self.registerButton addTarget:self action:@selector(enterRegisterVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registerButton];
    
    self.findPwdButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.findPwdButton settitle:@"忘记密码?" titleColor:LCHexColor(0x696C6F) font:12 image:nil];
    [self.findPwdButton addTarget:self action:@selector(enterFogetVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.findPwdButton];
    
    self.loginButton.sd_layout.leftSpaceToView(self.view,30).rightSpaceToView(self.view,30).topSpaceToView(self.view,183+19.5).heightIs(40);
    lineImageView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).topSpaceToView(self.loginButton,20).heightIs(1);
    self.registerButton.sd_layout.leftSpaceToView(self.view,15).topSpaceToView(lineImageView,10).widthIs(70).heightIs(20);
    self.findPwdButton.sd_layout.rightSpaceToView(self.view,15).topSpaceToView(lineImageView,10).widthIs(70).heightIs(20);
    
}

-(void)backToSeting{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
