//
//  RTreeIndexMacTests.m
//  RTreeIndexMacTests
//
//  Created by zhoudong on 11-9-27.
//  Copyright 2011年 tg. All rights reserved.
//

#import "RTreeIndexMacTests.h"
#import "Record.h"

#import "RTreeHelper.h"
#import "ZMPageHeader.h"

@implementation RTreeIndexMacTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    Record* rec = [Record createByType:rt_point_ext_id];
    NSLog(@"rec: %@", rec);
    STAssertTrue(rec != nil, @"Compiler isn't feeling well today :-(" );
}

-(void)test2
{
    double a = 1, b = 2;
    [RTreeHelper swapA:&a andB:&b];
    NSLog(@"a is %f, b is %f", a, b);
    
    double left = 10, right = 2, bottom = 6, top = 4;
    [RTreeHelper normalizeToAreaWithLeft:&left
                                  bottom:&bottom
                                   right:&right
                                     top:&top];
    NSLog(@"left is %f, right is %f", left, right);
    NSLog(@"bottom is %f, top is %f", bottom, top);
    //STAssertTrue(a == 2, @"Compiler isn't feeling well today :-(" );
}

//-(void)testWrite
//{
//    NSMutableData* data  = [[NSMutableData alloc] init];
//    ZMPageHeader* header = [[ZMPageHeader alloc] init];
//    header.pageId = 1;
//    header.freeSpace = 2;
//    header.end = 3;
//    header.numberOfRecords = 4;
//    header.numberOfVacantRecords = 5;
//    [header write:data];
//    [data writeToFile:@"/Users/zhoudong/Documents/devtemp/1.idx" atomically:YES];
//}

-(void)testRead
{
    NSMutableData* data  = [[NSMutableData alloc] initWithContentsOfFile:@"/Users/zhoudong/Documents/devtemp/1.idx"];
    ZMPageHeader* header = [[ZMPageHeader alloc] init];
    [header read:data];
    NSLog(@"%@", header);
}

@end
