//
//  ARGV.m
//  CLAide
//
//  Created by Heath Borders on 9/27/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import "ARGV.h"

@interface ARGV ()

@property (nonatomic) NSArray *objects;

@end

@implementation ARGV

- (instancetype)initWithObjects:(NSArray *)objects {
    self = [super init];
    if (self) {
        self.objects = objects;
    }
    
    return self;
}

#pragma mark - public API

- (NSArray *)remainder {
    NSMutableArray *remainder = [NSMutableArray arrayWithCapacity:[self.objects count]];
    for (id<NSObject> object in self.objects) {
        [remainder addObject:[object description]];
    }
    return remainder;
}

- (NSDictionary *)options {
    return nil;
}

- (void)shiftArgument {
    self.objects = [self.objects subarrayWithRange:NSMakeRange(1,
                                                               [self.objects count] - 1)];
}

@end
