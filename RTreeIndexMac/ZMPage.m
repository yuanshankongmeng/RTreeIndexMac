//
//  ZMPage.m
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import "ZMPage.h"

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


- (void)close
{
    
}

- (void)flush
{
    
}

- (void)dump
{
    
}

- (void)load
{
    
}
@end
