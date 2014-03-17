//
//  PerlinNoise.h
//  ImageFilters
//
//  Created by Администратор on 3/17/14.
//  Copyright (c) 2014 ItCraft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PerlinNoise.h"
#import "UIImage+ColorPlaceholder.h"

@interface PerlinNoiseEffect : NSObject

+(UIImage*)fillWithPerlinNoiseImageWithRect:(CGRect)rect;

@end
