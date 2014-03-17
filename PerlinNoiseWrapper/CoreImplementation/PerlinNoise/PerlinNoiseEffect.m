//
//  PerlinNoise.m
//  ImageFilters
//
//  Created by Администратор on 3/17/14.
//  Copyright (c) 2014 ItCraft. All rights reserved.
//

#import "PerlinNoiseEffect.h"

@implementation PerlinNoiseEffect

typedef struct CGImage* Bitmap;


typedef enum PIXEL_DATA
{
    ALPHA = 0,
    BLUE = 1,
    GREEN = 2,
    RED = 3
    
} PIXELS;


+(UIImage*)fillWithPerlinNoiseImageWithRect:(CGRect)rect
{
    UIImage* imageToFill = [UIImage placeholderImageWithColor:[UIColor blackColor]
                                                      andSize:rect.size];
    
    Bitmap lowLevelImage = [imageToFill CGImage];
    
    size_t width  = CGImageGetWidth(lowLevelImage);
    size_t height = CGImageGetHeight(lowLevelImage);
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    
    uint32_t* rawImageData = calloc(width*height* 4, sizeof(uint32_t));
    
    size_t bytesPerPixel = 4;
    size_t bytesPerRow  = bytesPerPixel* width;
    size_t bitsPerComponent = 8;
    
    CGContextRef imageContext =  CGBitmapContextCreate(rawImageData,
                                                       width,
                                                       height,
                                                       bitsPerComponent,
                                                       bytesPerRow,
                                                       colorSpace,
                                                       kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Little);
    
    
    CGContextDrawImage(imageContext, CGRectMake(0,0,
                                                rect.size.width,
                                                rect.size.height), lowLevelImage);
    
    PerlinNoise* perlinNoiseEffect = [[PerlinNoise alloc] init];

    
    dispatch_apply(height, dispatch_get_global_queue(0,0), ^(size_t i) {
        
        for (size_t j = 0 ; j < width; j++) {
            
            double x = (double)j/((double)width);
			double y = (double)i/((double)height);
            
			double n =  [perlinNoiseEffect noiseWith:10*x Y:10*y Z:0.8];
            
			n = 20 * [perlinNoiseEffect noiseWith:x Y:y Z:0.8];
			n = n - floor(n);
            
            uint8_t* rgbaPixel = (uint8_t*)&rawImageData [i*width + j];
        
            rgbaPixel[RED] =  (uint) floor(255 * n);
            rgbaPixel[GREEN] =(uint) floor(255 * n);
            rgbaPixel[BLUE]  = (uint)floor(255 * n);
            
        }
    });

    CGImageRef renderedImage = CGBitmapContextCreateImage(imageContext);
    UIImage* newImage = [UIImage imageWithCGImage:renderedImage];
    CGColorSpaceRelease(colorSpace);
    CGContextRelease(imageContext);
    return newImage;
    
}


@end
