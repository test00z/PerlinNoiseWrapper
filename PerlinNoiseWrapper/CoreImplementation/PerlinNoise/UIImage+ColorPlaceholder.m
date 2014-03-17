//
//  UIImage+ColorPlaceholder.m
//  DropDownListMoomkin
//
//  Created by Администратор on 3/18/14.
//  Copyright (c) 2014 ItCraft. All rights reserved.
//

#import "UIImage+ColorPlaceholder.h"

@implementation UIImage (ColorPlaceholder)

+(UIImage*)placeholderImageWithColor:(UIColor*)color andSize:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
