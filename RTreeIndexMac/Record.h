//
//  Record.h
//  RTreeIndexMac
//
//  Created by zhoudong on 11-9-27.
//  Copyright 2011年 tg. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "Enums.h"
#import "Point.h"
#import "ZMRectangle.h"
#import "RecordHeader.h"

@interface Record : NSObject {
    const int ALIGNED;
    
    
}

@property UInt32 recordId;
@property (assign) RecordHeader* recordHeader;

+(Record*)createByType:(GistExtentionId)extId;

-(UInt32)getChild;
-(ZMRectangle*)getRectangle;
-(ZMPoint*)getPoint;
-(BOOL)isContained:(ZMRectangle*)rect;
-(BOOL)isContains:(ZMRectangle*)rect;
-(BOOL)isOverlaps:(ZMRectangle*)rect;
-(double)getArea;
@end