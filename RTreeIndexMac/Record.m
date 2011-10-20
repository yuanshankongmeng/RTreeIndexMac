//
//  Record.m
//  RTreeIndexMac
//
//  Created by zhoudong on 11-9-27.
//  Copyright 2011年 tg. All rights reserved.
//

#import "Record.h"
@class PointRecord;
@class RectangleRecord;
@class RecordHeader;

const int ALIGNED = 4;

@implementation Record

@synthesize recordHeader;
@synthesize recordId;

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

+(Record *)createByType:(GistExtentionId)extId
{
    
    Record* rec = nil;
    if(extId == rt_point_ext_id){
        rec = [[PointRecord alloc] init];
    }else{
        rec = [[RectangleRecord alloc] init];
    }
    return rec;
        
}

- (UInt32)getChild
{
    return recordHeader.childNodeId;
}

@end
