//
//  ZMHeaderPage.h
//  RTreeIndexMac
//
//  Created by zhou dong on 11-10-20.
//  Copyright (c) 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZMPage.h"

@class ZMFileHeader;


@interface ZMHeaderPage : ZMPage
{
    ZMFileHeader* fileHeader_;
    
}

@property(retain) ZMFileHeader* fileHeader;

-(void)read;
-(void)write;

@end
