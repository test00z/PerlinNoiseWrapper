//
//  UIImageView+PerlinNoise.m
//  ImageFilters
//
//  Created by Администратор on 3/17/14.
//  Copyright (c) 2014 ItCraft. All rights reserved.
//

#import "UIImageView+PerlinNoise.h"

@implementation UIImageView (PerlinNoise)

-(void)fillWithPerlinNoise
{
  self.image = [PerlinNoiseEffect fillWithPerlinNoiseImageWithRect:self.frame];
}


@end
