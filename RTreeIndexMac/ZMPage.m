//
//  ZMPage.m
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import "ZMPage.h"
#import "ZMRTreeFile.h"

@implementation ZMPage

// Count of slot before record slot 
static const int COUNT_SLOT_ALLIGNED = 2;
// Error message for index out of range
static NSString* const ERR_OUTOFRANGE = @"Index out of range";

// Size of PAGEHEADER
static const int SIZE_OF_PAGEHEADER = 16;
// Size of RECORDSETHEADER
static const int SIZE_OF_RECORDSETHEADER = 8;
// Size of SLOT	
static const int SIZE_OF_SLOT = 4;

@synthesize pageNumber = pageNo_;
@synthesize fileType = gistId_;
@synthesize isFloat = isFloat_;
@synthesize rTreeFile = rtreeFile_;

- (id)init
{
    [self dealloc];
    @throw [NSException exceptionWithName:@"BNRBadInitCall"
                                   reason:@"Initialize ZMRTree with initWithFile"
                                 userInfo:nil];
    return nil;
}

- (id)initWithFile:(ZMRTreeFile *)file
{
    return [self initWithFile:file pageNo:0 gistType:0];
}


- (id)initWithFile:(ZMRTreeFile *)file gistType:(GistExtentionId)typeId
{
    return  [self initWithFile:file pageNo:0 gistType:typeId];
}


- (id)initWithFile:(ZMRTreeFile *)file pageNo:(UInt32)pageNo
{
    return [self initWithFile:file pageNo:pageNo gistType:0];
}


- (id)initWithFile:(ZMRTreeFile *)file pageNo:(UInt32)pageNo gistType:(GistExtentionId)typeId
{
    if([super init]){
        rtreeFile_ = file;
        pageNo_ = pageNo;
        gistId_ = typeId;
        isFloat_ = rtreeFile_.isFloat;
        [self load];
    }
    return self;
}



- (void)dealloc
{
    [rtreeFile_ release];
    [fileHandle_ release];
}

- (void)close
{
    [fileHandle_ closeFile];
}

- (void)flush
{
    if(isDirty_){
        [fileHandle_ seekToFileOffset:pageNo_ * pageSize_];
        [fileHandle_ writeData:writer_];
    }
}

- (NSString*)dump
{
    return @"";
}

- (void)load
{
    if(pageNo_ <= 0){
        return;
    }
    pageSize_ = rtreeFile_.pageSize;
    [fileHandle_ seekToFileOffset:0];
    reader_ = [fileHandle_ readDataOfLength:pageSize_];
    writer_ = [[NSMutableData alloc] init];
    
}
@end
