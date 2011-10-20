//
//  RecordHeader.h
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-3.
//  Copyright 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RecordHeader : NSObject {
    
    
}

@property UInt16 keyLength;
@property UInt16 elementLength;
@property UInt32 childNodeId;

+ (int) getSize;
@end
