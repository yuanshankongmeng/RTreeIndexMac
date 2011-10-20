//
//  PointRecord.m
//  RTreeIndexMac
//
//  Created by zhoudong on 11-9-27.
//  Copyright 2011年 tg. All rights reserved.
//

#import "PointRecord.h"


@implementation PointRecord

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

-(BOOL)isOverlaps:(ZMRectangle*)rect
{
    bool bRtn = [ self isContained:rect];
    return bRtn;
}

- (BOOL)isContains:(ZMRectangle *)rect
{
    return NO;
}

 - (BOOL)isContained:(ZMRectangle *)rect
{
    [rect normalize];
    ZMRectangle* source = [self getRectangle];
    bool bRtn = [source isContainedRectangle:rect];
    return bRtn;
}

@end
