//
//  IMHBreakingQuote.m
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "IMHBreakingQuote.h"

@implementation IMHBreakingQuote

- (instancetype)initWithQuote:(NSString *)quote
{
    self = [super init];
    if (self != nil)
    {
        _breakingQuote = quote;
    }
    return self;
}

@end
