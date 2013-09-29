//
//  ARGV_Tests.m
//  CLAide
//
//  Created by Heath Borders on 9/27/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ARGV.h"

@interface ARGV_TestsStubString : NSObject

- (id)initWithDescription:(NSString *)description;

@end

@interface ARGV_Tests : XCTestCase

@end

@implementation ARGV_Tests

- (void)testConvertsObjectsIntoStringsWhileParsing {
    ARGV *testObject = [[ARGV alloc] initWithObjects:(@[
                                                  [[ARGV_TestsStubString alloc] initWithDescription:@"--flag"],
                                                  [[ARGV_TestsStubString alloc] initWithDescription:@"ARG"],
                                                  ])];
    XCTAssertEqualObjects(testObject.remainder, (@[
                                             @"--flag",
                                             @"ARG",
                                             ]), @"");
}

- (void)testOnlyRemovesOneEntryWhenCallingShiftArgument {
    ARGV *testObject = [[ARGV alloc] initWithObjects:(@[
                                                  @"ARG",
                                                  @"ARG",
                                                  ])];
    [testObject shiftArgument];
    
    XCTAssertEqualObjects(testObject.remainder, (@[
                                             @"ARG",
                                             ]), @"");
}

@end

@interface ARGV_Complex_Tests : XCTestCase {
    ARGV *testObject;
}

@end

@implementation ARGV_Complex_Tests

- (void)setUp {
    [super setUp];
    
    testObject = [[ARGV alloc] initWithObjects:(@[
                                                  @"--flag",
                                                  @"--option=VALUE",
                                                  @"ARG1",
                                                  @"ARG2",
                                                  @"--no-other-flag",
                                                  ])];
}

- (void)testReturnsTheOptionsAsAHash {
    XCTAssertEqualObjects(testObject.options, (@{
                                                 @"flag" : @YES,
                                                 @"other-flag" : @NO,
                                                 @"option" : @"VALUE",
                                                 }), @"");
}

@end

@implementation ARGV_TestsStubString {
    NSString *_innerDescription;
}

- (id)initWithDescription:(NSString *)description {
    self = [super init];
    if (self) {
        _innerDescription = description;
    }
    return self;
}

- (NSString *)description {
    return _innerDescription;
}

@end
