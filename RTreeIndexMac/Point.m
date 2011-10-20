//
//  Point.m
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-3.
//  Copyright 2011年 tg. All rights reserved.
//

#import "Point.h"


@implementation ZMPoint

@synthesize x;
@synthesize y;
- (id)init
{
    return [self initWithX:0 andY:0];
}

- (id) initWithX:(double)aX andY:(double) aY
{
    self = [super init];
    if (self) {
        x = aX;
        y = aY;
        // Initialization code here.
    }
    
    return self;

}

- (void)dealloc
{
    [super dealloc];
}

-(BOOL)isEquals:(ZMPoint *)point
{
    BOOL equal = NO;
    if(x == point.x && y == point.y){
        equal = YES;
    }
    return equal;
}


+(int)getSize:(BOOL)isFloat
{
    if(isFloat){
        return 8;
    }else{
        return 16;
    }
}


@end
