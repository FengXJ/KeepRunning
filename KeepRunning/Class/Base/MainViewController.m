//
//  MainViewController.m
//  KeepRunning
//
//  Created by 冯学杰 on 16/5/30.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setBg];

}

-(void)setBg{
    
    UIImageView *bgImgV= [[UIImageView alloc]init];
    bgImgV.image = [UIImage imageNamed:@"bgImage"];
    bgImgV.alpha = 0.4;
    [self.view addSubview:bgImgV];
    bgImgV.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0,0,0,0));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end