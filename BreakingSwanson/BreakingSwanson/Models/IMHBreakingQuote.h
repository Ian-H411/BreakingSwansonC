//
//  IMHBreakingQuote.h
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMHBreakingQuote : NSObject

@property (nonatomic, copy, readonly) NSString *breakingQuote;

-(instancetype)initWithQuote:(NSString *)quote;

@end

NS_ASSUME_NONNULL_END
