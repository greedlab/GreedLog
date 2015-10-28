//
//  ExampleTests.m
//  ExampleTests
//
//  Created by Bell on 15/10/28.
//  Copyright © 2015年 GreedLab. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GRLog.h"

@interface ExampleTests : XCTestCase

@end

@implementation ExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testLog
{
    [GRLog setGRLogLevel:GRLogLevelDebug];
    GRLog(@"Demo for GRLog");
    GRLogEmergency(@"Demo for GRLogEmergency");
    GRLogAlert(@"Demo for GRLogAlert");
    GRLogCritical(@"Demo for GRLogCritical");
    GRLogError(@"Demo for GRLogError");
    GRLogWarning(@"Demo for GRLogWarning");
    GRLogNotice(@"Demo for GRLogNotice");
    GRLogInfo(@"Demo for GRLogInfo");
    GRLogDebug(@"Demo for GRLogDebug");
    NSLog(@"Demo for NSLog");
}

@end
