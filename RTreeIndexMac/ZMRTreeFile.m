//
//  ZMRTreeFile.m
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import "ZMRTreeFile.h"
#import "ZMPageHeader.h"


@implementation ZMRTreeFile 

@synthesize isFloat = isFloat_;
@synthesize pageSize = pageSize_;
@synthesize isReadonly = isReadOnly_;

- (id)init
{
    if([super init]){
        
    }
    return  self;
}


- (void)dealloc
{
    [ZMPageHeader release];
     
}

- (void)openFile:(NSString *)file isReadonly:(BOOL)readOnly
{
    if(isOpen_){
        return;
    }
    
}

@end
