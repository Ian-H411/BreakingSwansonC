//
//  IMHSwansonQuoteModel.h
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IMHSwansonQuoteModel : NSObject

@property (nonatomic, copy, readonly) NSString *SwansonQuote;

-(instancetype) initWithQuote:(NSString *)Quote;

@end

NS_ASSUME_NONNULL_END
