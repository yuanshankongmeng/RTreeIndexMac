//
//  Point.h
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-3.
//  Copyright 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZMPoint : NSObject {

    
}

@property double x;
@property double y;

-(id)initWithX:(double)aX andY:(double)aY;
-(BOOL)isEquals:(ZMPoint*) point;
+(int)getSize: (BOOL)isFloat;
    

@end
