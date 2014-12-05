//
//  ExplorerTests.m
//  ExplorerTests
//
//  Created by Janusz Chudzynski on 12/5/14.
//  Copyright (c) 2014 Janusz Chudzynski. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface ExplorerTests : XCTestCase
    @property ViewController * controller;
@end

@implementation ExplorerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    _controller = [ViewController new];

}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testLocations {
      NSArray * locations = [_controller prepareLocations];
    XCTAssert(locations!=NULL, @"Array is null");
    
//    NSMutableArray * locations  = [NSMutableArray new];
    int locations_count = 0;
    for(NSDictionary * location in locations){
        XCTAssert([location objectForKey:@"latitude"]!= NULL, @"This object must have a latitude key");
 
        XCTAssert([location objectForKey:@"longitude"]!= NULL, @"This object must have a longitude key");
        
         XCTAssert([location objectForKey:@"name"]!= NULL, @"This object must have a name key");
        
        if([[location objectForKey:@"name"]isEqualToString:@"Seville"] )
        {
            locations_count++;
        }
        if([[location objectForKey:@"name"]isEqualToString:@"Flounders"] )
        {
            locations_count++;
        }
        if([[location objectForKey:@"name"]isEqualToString:@"UWF"] )
        {
            locations_count++;
        }
    }
     XCTAssert(locations_count==3, @"Number of locations is incorrect");
    

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
