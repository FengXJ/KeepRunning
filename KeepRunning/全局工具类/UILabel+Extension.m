//
//  UILabel+UILabel.m
//  传感Demo
//
//  Created by 冯学杰 on 16/4/5.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+ (CGFloat)getHeightByWidth:(CGFloat)width title:(NSString *)title font:(UIFont *)font
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width, 0)];
    label.text = title;
    label.font = font;
    label.numberOfLines = 0;
    [label sizeToFit];
    CGFloat height = label.frame.size.height;
    return height;
}

+ (CGFloat)getWidthWithTitle:(NSString *)title font:(UIFont *)font {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 1000, 0)];
    label.text = title;
    label.font = font;
    [label sizeToFit];
    return label.frame.size.width;
}

+(UILabel *)setLabelTextColor:(UIColor*)color font:(CGFloat)cgFloat{
    UILabel *label = [[UILabel alloc]init];
    label.font = [LCFont systemFontOfSize:cgFloat];
    label.textColor = color;
    return label;
}

-(UILabel *)setTextColor:(UIColor*)color font:(CGFloat)cgFloat{
    self.font = [LCFont systemFontOfSize:cgFloat];
    self.textColor = color;
    return self;
}
@end

