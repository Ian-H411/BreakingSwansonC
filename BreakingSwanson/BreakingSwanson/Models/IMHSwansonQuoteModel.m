//
//  IMHSwansonQuoteModel.m
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "IMHSwansonQuoteModel.h"

@implementation IMHSwansonQuoteModel

- (instancetype)initWithQuote:(NSString *)Quote
{
    self = [super init];
    if (self != nil)
    {
        _SwansonQuote = Quote;
    }
    return self;
}


@end
