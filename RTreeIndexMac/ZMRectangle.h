//
//  ZMRectangle.h
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-3.
//  Copyright 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Point.h"
#import "RTreeHelper.h"

@interface ZMRectangle : NSObject {

}
@property(retain) ZMPoint* leftBottomPoint;
@property(retain) ZMPoint* rightTopPoint;

-(id)initWithFirstX:(double)x1 firstY:(double)y1
            secondX:(double)x2 secondY:(double)y2;
-(double)getMinDistance:(ZMPoint*)p;
-(void)normalize;
+(int)getSize:(BOOL)isFloat;
-(BOOL)isContainsPoint:(ZMPoint*)point;
-(BOOL)isContainsRectangle:(ZMRectangle*)rectangle;
-(BOOL)isContainedRectangle:(ZMRectangle*)rectangle;
-(BOOL)isOverlapsRectangle:(ZMRectangle*)rectangle;
-(BOOL)isEqualsRectangle:(ZMRectangle*)rectangle;
-(double)getWidth;
-(double)getHeight;
-(double)getArea;
@end
