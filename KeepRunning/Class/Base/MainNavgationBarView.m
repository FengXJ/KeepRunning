//
//  MainNavgationBarView.m
//  科本
//
//  Created by 冯学杰 on 16/4/12.
//  Copyright © 2016年 无锡科本信息科技有限公司. All rights reserved.
//

#import "MainNavgationBarView.h"

@implementation MainNavgationBarView

-(id)initWithTitle:(NSString*)title {
    if (self = [super init])
    {
        self.backgroundColor = [UIColor whiteColor];
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, 68);
        
        self.navTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 35, 100, 18)];
        self.navTitleLabel.text = title;
        self.navTitleLabel.font = [LCFont systemFontOfSize:18];
        self.navTitleLabel.textAlignment = NSTextAlignmentCenter;
        self.navTitleLabel.textColor = [UIColor blackColor];
        [self addSubview:self.navTitleLabel];
        [self navBarLeftBtn];
        
        UIImageView *lineImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 67.5, SCREEN_WIDTH, 0.5)];
        lineImageView.backgroundColor = LINECOLOR;
        [self addSubview:lineImageView];
    }
    return self;
}

-(void)navBarLeftBtn{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    backButton.frame = CGRectMake(0,20,40,48);
    backButton.backgroundColor = [UIColor clearColor];
    UIImage *image = [UIImage imageNamed:@"back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, 5, 0,0)];
    [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backButton];
    
}
-(void)back{
    UIViewController *vc= [self viewController];
    [vc.navigationController popViewControllerAnimated:YES];
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next;
         next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
