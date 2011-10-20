//
//  ZMFileHeader.h
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMFileHeader : NSObject
{
    NSString* magicString_;
    UInt32 extId_;
    UInt32 freePage_;
    NSString* extName_;
    UInt32 pageSize_;
    BOOL isFloat_;
}


-(void)read:(NSMutableData*)reader;

-(void)write:(NSMutableData*)writer;

@end
