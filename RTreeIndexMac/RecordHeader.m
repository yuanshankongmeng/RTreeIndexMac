//
//  RecordHeader.m
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-3.
//  Copyright 2011年 tg. All rights reserved.
//

#import "RecordHeader.h"


@implementation RecordHeader

@synthesize  childNodeId;
@synthesize elementLength;
@synthesize keyLength;

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

-(NSString*) description
{
    return [NSString stringWithFormat:@"key length: %d, element length: %d, child node id: %d", keyLength,
            elementLength,
            childNodeId];
}

+(int)getSize
{
    return 8;
}

@end
