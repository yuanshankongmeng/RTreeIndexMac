//
//  ZMRectangle.m
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-3.
//  Copyright 2011年 tg. All rights reserved.
//

#import "ZMRectangle.h"


@implementation ZMRectangle

@synthesize  leftBottomPoint;
@synthesize  rightTopPoint;

- (id)init
{
    return [self initWithFirstX:0
                         firstY:0
                        secondX:0
                        secondY:0];
}

-(id) initWithFirstX:(double)x1 firstY:(double)y1 
             secondX:(double)x2 secondY:(double)y2
{
    self = [super init];
    if (self) {
       
        leftBottomPoint.x = x1;
        leftBottomPoint.y = y1;
        rightTopPoint.x = x2;
        rightTopPoint.y = y2;
    }
    
    return self;
}

- (void)dealloc
{
    [leftBottomPoint release];
    [rightTopPoint release];
    [super dealloc];
}

- (BOOL)isEqualsRectangle:(ZMRectangle *)rectangle
{
    BOOL bRtn = YES;
    if ((leftBottomPoint.x != rectangle.leftBottomPoint.x)
        || (leftBottomPoint.y != rectangle.leftBottomPoint.y)
        || (rightTopPoint.x != rectangle.rightTopPoint.x) 
        || (rightTopPoint.y != rectangle.rightTopPoint.y))
    {
        bRtn = NO;
    }
    return bRtn;
}

-(double)getWidth
{
    double width = fabs(rightTopPoint.x - leftBottomPoint.x);
    return width;
}

- (double)getHeight
{
    double height = fabs(rightTopPoint.y - leftBottomPoint.y);
    return height;
}

-(double)getArea
{
    return [self getWidth] * [self getHeight];
            
}

-(double)getMinDistance:(ZMPoint *)p
{
    if(p.x < leftBottomPoint.x && p.y > rightTopPoint.y){
        return sqrt(pow(leftBottomPoint.x - p.x, 2) + 
                    pow(p.y - rightTopPoint.y, 2));
    }else if(p.x > rightTopPoint.x && p.y > rightTopPoint.y){
        return sqrt(pow(p.x - rightTopPoint.x, 2) +
                    pow(p.y - rightTopPoint.y, 2));
    }else if(p.x > rightTopPoint.x && p.y < leftBottomPoint.y){
        return sqrt(pow(p.x - rightTopPoint.x, 2) +
                    pow(leftBottomPoint.y - p.y, 2));
    }else if(p.x < leftBottomPoint.x && p.y < leftBottomPoint.y){
        return sqrt(pow(leftBottomPoint.x - p.x, 2) +
                    pow(leftBottomPoint.y - p.y, 2));
    }else if(p.x < leftBottomPoint.x || p.x > rightTopPoint.x){
        return MIN(fabs(leftBottomPoint.x - p.x), 
                   fabs(p.x - rightTopPoint.x));
    }else if(p.y < leftBottomPoint.y || p.y > rightTopPoint.y){
        return MIN(fabs(leftBottomPoint.y - p.y), 
                   fabs(p.y - rightTopPoint.y));
    }else{
        return 0;
    }
}

-(void)normalize
{
    double x1, y1, x2, y2;
    x1 = leftBottomPoint.x;
    y1 = leftBottomPoint.y;
    x2 = rightTopPoint.x;
    y2 = rightTopPoint.y;
    [RTreeHelper normalizeToAreaWithLeft:&x1
                                  bottom:&y1
                                   right:&x2
                                     top:&y2];
    
    leftBottomPoint.x = x1;
    leftBottomPoint.y = y1;
    rightTopPoint.x = x2;
    rightTopPoint.y = y2;
}

+(int)getSize:(BOOL)isFloat
{
    if(isFloat){
        return 16;
    }else{
        return 32;
    }
}

- (BOOL)isContainedRectangle:(ZMRectangle *)rectangle
{
    [self normalize];
    [rectangle normalize];
    BOOL contained = [rectangle isContainsRectangle:self];
    return contained;
}

- (BOOL)isOverlapsRectangle:(ZMRectangle *)rectangle
{
    [self normalize];
    [rectangle normalize];
    BOOL overlap = NO;
    if(((leftBottomPoint.x >= rectangle.leftBottomPoint.x && leftBottomPoint.x <= rectangle.rightTopPoint.x) ||
       (rightTopPoint.x >= rectangle.leftBottomPoint.x && rightTopPoint.x <= rectangle.rightTopPoint.x)
       ||
       (rectangle.leftBottomPoint.x >= leftBottomPoint.x && rectangle.leftBottomPoint.x <= rightTopPoint.x) ||
       (rectangle.rightTopPoint.x >= leftBottomPoint.x && rectangle.rightTopPoint.x <= rightTopPoint.x))
       &&
       ((leftBottomPoint.y >= rectangle.leftBottomPoint.y && leftBottomPoint.y <= rectangle.rightTopPoint.y) ||
        (rightTopPoint.y >= rectangle.leftBottomPoint.y && rightTopPoint.y <= rectangle.rightTopPoint.y) ||
        (rectangle.leftBottomPoint.y >= leftBottomPoint.y && rectangle.leftBottomPoint.y <= rightTopPoint.y) ||
        (rectangle.rightTopPoint.y >= leftBottomPoint.y && rectangle.rightTopPoint.y <= rightTopPoint.y)))
    {
        overlap = YES;
    }
    return overlap;
}

- (BOOL)isContainsPoint:(ZMPoint *)point
{
    [self normalize];
    BOOL bRtn = YES;
    if (point.x > leftBottomPoint.x && point.x < rightTopPoint.x
        && point.y > leftBottomPoint.y && point.y < rightTopPoint.y)
    {
        bRtn = NO;
    }
    return bRtn;
}

- (BOOL)isContainsRectangle:(ZMRectangle *)rectangle
{
    [self normalize];
    [rectangle normalize];
    BOOL bRtn = YES;
    if (leftBottomPoint.x <= rectangle.leftBottomPoint.x
        && leftBottomPoint.y <= rectangle.leftBottomPoint.y
        && rightTopPoint.x >= rectangle.rightTopPoint.x
        && rightTopPoint.y >= rectangle.rightTopPoint.y)
    {
        bRtn = NO;
    }
    return bRtn;
}
@end
