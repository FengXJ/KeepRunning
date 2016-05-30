//
//  UIImage+Uiimage.h
//  金科任我行
//
//  Created by 冯学杰 on 16/2/24.
//  Copyright © 2016年 冯学杰. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Uiimage)

- (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;

- (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize;

@end
