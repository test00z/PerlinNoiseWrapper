//
//  UIView+PerlinNoise.m
//  DropDownListMoomkin
//
//  Created by Администратор on 3/18/14.
//  Copyright (c) 2014 ItCraft. All rights reserved.
//

#import "UIView+PerlinNoise.h"

@implementation UIView (PerlinNoise)

-(void)fillWithPerlinNoise
{
    [self setBackgroundColor:[UIColor colorWithPatternImage:[PerlinNoiseEffect fillWithPerlinNoiseImageWithRect:self.frame]]];
}

@end
