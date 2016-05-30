//
//  UIButton+Extension.m
//  科本
//
//  Created by 冯学杰 on 16/4/20.
//  Copyright © 2016年 无锡科本信息科技有限公司. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

-(void)settitle:(NSString *)str titleColor:(UIColor*)color font:(CGFloat)font image:(UIImage*)image{
    [self setTitle:str forState:UIControlStateNormal];
    [self setTitleColor:color forState:UIControlStateNormal];
    self.titleLabel.font = [LCFont systemFontOfSize:font];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self setImage:image forState:UIControlStateNormal];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    
}

@end
