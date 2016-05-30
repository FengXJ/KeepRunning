//
//  UILabel+UILabel.h
//  传感Demo
//
//  Created by 冯学杰 on 16/4/5.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Extension)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont*)font;

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font;

+(UILabel *)setLabelTextColor:(UIColor*)color font:(CGFloat)cgFloat;

-(UILabel *)setTextColor:(UIColor*)color font:(CGFloat)cgFloat;
@end
