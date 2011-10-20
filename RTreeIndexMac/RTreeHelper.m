//
//  RTreeHelper.m
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-4.
//  Copyright 2011年 tg. All rights reserved.
//

#import "RTreeHelper.h"


@implementation RTreeHelper

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

//	Normalize the data to RECTANGLE_D cooridates		In RECTANGLE_D struct
//	After normalize,												  +-----------> X
//		left < right												  |
//		bottom < top												  |
//	Return decimalDegreesValue													  |
//		true for data changed										  |
//		false for not												  Y
+(BOOL)normalizeToAreaWithLeft:(double *)left 
                        bottom:(double *)bottom 
                         right:(double *)right 
                           top:(double *)top
{
    BOOL rtn = NO;
    if(*left > *right){
        [self swapA:left andB:right];
        rtn = YES;
    }if(*bottom > *top){
        [self swapA:bottom andB:top];
        rtn = YES;
    }
    return rtn;
}

+(void)swapA:(double *)a andB:(double *)b
{
    double temp = *a;
    *a = *b;
    *b = temp;
}

@end
