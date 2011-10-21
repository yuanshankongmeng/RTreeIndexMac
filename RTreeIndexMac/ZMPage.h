//
//  ZMPage.h
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@class ZMRTreeFile;

@interface ZMPage : NSObject
{
    ZMRTreeFile* rtreeFile_;
    NSFileHandle* fileHandle_;
    NSData* reader_;
    NSMutableData* writer_;
    UInt32 pageNo_;
    GistExtentionId gistId_;
    BOOL isDirty_;
    BOOL isFloat_;
    int pageSize_;
}

@property UInt32 pageNumber;
@property(readonly) GistExtentionId fileType;
@property(readonly) BOOL isFloat;
@property(readonly, assign) ZMRTreeFile* rTreeFile;

-(id)initWithFile:(ZMRTreeFile*)file;
-(id)initWithFile:(ZMRTreeFile *)file pageNo:(UInt32)pageNo;
-(id)initWithFile:(ZMRTreeFile*)file gistType:(GistExtentionId)typeId;
-(id)initWithFile:(ZMRTreeFile *)file pageNo:(UInt32)pageNo gistType:(GistExtentionId)typeId;

-(void)close;
-(void)flush;
-(void)load;
-(NSString*)dump;
-(void)setModified;
@end
