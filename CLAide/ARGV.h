//
//  ARGV.h
//  CLAide
//
//  Created by Heath Borders on 9/27/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ARGV : NSObject

@property (nonatomic, readonly) NSArray *remainder;

- (instancetype)initWithObjects:(NSArray *)objects;

- (void)shiftArgument;

@end
