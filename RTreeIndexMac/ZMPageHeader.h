//
//  ZMPageHeader.h
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-19.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZMPageHeader : NSObject{
    UInt32 pId_;			// Id of the page
    UInt16 space_;		// Free space of the page
    UInt16 end_;			// Offset to the end of data area
    UInt16 nslots_;		// Number of records
    UInt16 nvacant_;		// Number of vacant records
    UInt32 fill1_;		// Make the header a multiple of 8 bytes		
    
}

@property UInt32 pageId;
@property UInt16 freeSpace;
@property UInt16 end;
@property UInt16 numberOfRecords;
@property UInt16 numberOfVacantRecords;
@property UInt32 fill;

+ (int)getSize;

- (void)read:(NSData*)reader;
- (void)write:(NSData*)writer;

@end
