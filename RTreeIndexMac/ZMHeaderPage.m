//
//  ZMHeaderPage.m
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import "ZMHeaderPage.h"
#import "ZMFileHeader.h"

@implementation ZMHeaderPage

@synthesize fileHeader = fileHeader_;


- (void)read
{
    
    [fileHandle_ seekToFileOffset:0];
    [fileHeader_ read:reader_];

}

- (void)write
{
    [fileHandle_ seekToFileOffset:0];
    [fileHeader_  write:writer_];
    isDirty_ = YES;
    [self flush];
}

- (NSString*)dump
{
    return [fileHeader_ description];
}
@end
