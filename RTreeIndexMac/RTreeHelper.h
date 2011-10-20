//
//  RTreeHelper.h
//  RTreeIndexMac
//
//  Created by zhoudong on 11-10-4.
//  Copyright 2011年 tg. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RTreeHelper : NSObject {

    
}


+(BOOL)normalizeToAreaWithLeft:(double*)left 
                        bottom:(double*)bottom
                         right:(double*)right
                           top:(double*)top;

+(void)swapA:(double*)a andB:(double*)b;
@end
