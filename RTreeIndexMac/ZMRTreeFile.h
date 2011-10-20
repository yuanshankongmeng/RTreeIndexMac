//
//  ZMRTreeFile.h
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Enums.h"

@class ZMPageHeader;
@class ZMDataPage;

@interface ZMRTreeFile : NSObject
{
    ZMPageHeader* pageHeader_;
    BOOL isOpen_;
    BOOL isReadOnly_;
    BOOL isFloat_;
    int pageSize_;
    
}

@property int pageSize;
@property BOOL isFloat;
@property(readonly) BOOL isReadonly;

+ (void)createFile:(NSString*)file withGisExtention:(GistExtentionId)gistId;
-(void)openFile:(NSString*)file isReadonly:(BOOL)readOnly;
-(void)close;
-(void)flush;
-(void)readFileHeader;
-(void)writeFileHeader;
-(GistExtentionId)getFileType;
-(ZMDataPage*)getRootNodePage;
-(int)getPageCount;
@end
