//
//  ZMFileHeader.m
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import "ZMFileHeader.h"

@implementation ZMFileHeader

static NSString* const MAGIC_STR = @"Gist data file";
static const int MAGICSTR_LENTH = 15;
static const int POINT_EXT_LENGTH = 13;
static const int RECT_EXT_LENGTH = 12;
static const int UINT32_LENGTH = sizeof(UInt32);
static const int UINT8_LENGTH = sizeof(Byte);

- (id)init
{
    if([super init]){
        extId_ = 0;
        freePage_ = 0;
        extName_ = @"";
        pageSize_ = 0;
    }
    return self;
}

- (void)read:(NSMutableData *)reader
{
    int offset = 0;
    NSData* stringData = [reader subdataWithRange:NSMakeRange(offset, MAGICSTR_LENTH)];
    magicString_ = [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
    offset += MAGICSTR_LENTH;
    [reader getBytes:&extId_ range:NSMakeRange(offset, POINT_EXT_LENGTH)];
    offset += UINT32_LENGTH;
    [reader getBytes:&freePage_ range:NSMakeRange(offset, UINT32_LENGTH)];
    offset += UINT32_LENGTH;
    if(extId_ == 0){
        stringData = [reader subdataWithRange:NSMakeRange(offset, POINT_EXT_LENGTH)];
        offset += POINT_EXT_LENGTH;
     }else{
        stringData = [reader subdataWithRange:NSMakeRange(offset, RECT_EXT_LENGTH)];
        offset += RECT_EXT_LENGTH;
    }
    extName_ = [[NSString alloc] initWithData:stringData encoding:NSUTF8StringEncoding];
    [reader getBytes:&pageSize_ range:NSMakeRange(offset, UINT32_LENGTH)];
    offset += UINT32_LENGTH;
    Byte  isFloat = 0;
    [reader getBytes:&isFloat range:NSMakeRange(offset, UINT8_LENGTH)];
    isFloat_ = (isFloat == 0) ? NO : YES;
    
}

- (void)write:(NSMutableData *)writer
{
    [writer appendBytes:&magicString_ length:MAGICSTR_LENTH];
    [writer appendBytes:&extId_ length:UINT32_LENGTH];
    [writer appendBytes:&extName_ length:[extName_ length]];
    [writer appendBytes:&pageSize_ length:UINT32_LENGTH];
     Byte isFloat = isFloat_ ? 1 : 0;
    [writer appendBytes:&isFloat length:sizeof(Byte)];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"magicStr: %@, extId: %d, extName: %@, pageSize: %@, isFloat: %d", magicString_, extId_, extName_, pageSize_, isFloat_];
}
@end
