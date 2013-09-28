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
    ARGV *argv = [[ARGV alloc] initWithObjects:(@[
                                                  [[ARGV_TestsStubString alloc] initWithDescription:@"--flag"],
                                                  [[ARGV_TestsStubString alloc] initWithDescription:@"ARG"],
                                                  ])];
    XCTAssertEqualObjects(argv.remainder, (@[
                                             @"--flag",
                                             @"ARG",
                                             ]), @"");
}

- (void)testOnlyRemovesOneEntryWhenCallingShiftArgument {
    ARGV *argv = [[ARGV alloc] initWithObjects:(@[
                                                  @"ARG",
                                                  @"ARG",
                                                  ])];
    [argv shiftArgument];
    
    XCTAssertEqualObjects(argv.remainder, (@[
                                             @"ARG",
                                             ]), @"");
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
