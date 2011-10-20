//
//  ZMPageHeader.m
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-19.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import "ZMPageHeader.h"

@implementation ZMPageHeader

@synthesize pageId = pId_;
@synthesize freeSpace = space_;
@synthesize end = end_;
@synthesize numberOfRecords = nslots_;
@synthesize  numberOfVacantRecords = nvacant_;
@synthesize  fill = fill1_;

static const int sizeOfUInt16 = sizeof(UInt16);
static const int sizeOfUInt32 = sizeof(UInt32);

- (id)init
{
    self = [super init];
    if (self) {
        pId_ = 0;
        space_ = 0;
        end_ = 0;
        nslots_ = 0;
        nvacant_ = 0;
        fill1_ = 0x0F0F0F0F;		// For aligned
    }
    
    return self;
   
}

+ (int)getSize
{
    
    return 16;
}

- (void)read:(NSMutableData *)reader
{
    int offset = 0;
    [reader getBytes:&pId_ range:NSMakeRange(offset, sizeOfUInt32)];
    offset = sizeOfUInt32;
    [reader getBytes:&space_ range:NSMakeRange(offset, sizeOfUInt16)];
    offset += sizeOfUInt16;
    [reader getBytes:&end_ range:NSMakeRange(offset, sizeOfUInt16)];
    offset += sizeOfUInt16;
    [reader getBytes:&nslots_ range:NSMakeRange(offset, sizeOfUInt16)];
    offset += sizeOfUInt16;
    [reader getBytes:&nvacant_ range:NSMakeRange(offset, sizeOfUInt16)];
    offset += sizeOfUInt16;
    [reader getBytes:&fill1_ range:NSMakeRange(offset, sizeOfUInt32)];
    
}

- (void)write:(NSMutableData *)writer
{
    [writer appendBytes:&pId_ length:sizeOfUInt32];
    [writer appendBytes:&space_ length:sizeOfUInt16];
    
    [writer appendBytes:&end_ length:sizeOfUInt16];
    [writer appendBytes:&nslots_ length:sizeOfUInt16];
    [writer appendBytes:&nvacant_ length:sizeOfUInt16];
    [writer appendBytes:&fill1_ length:sizeOfUInt32];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"pId: %d, space: %d, end: %d, nslots: %d, nvacant: %d, fill1: %d", pId_, space_, end_, nslots_, nvacant_, fill1_];
                                    
}

@end
