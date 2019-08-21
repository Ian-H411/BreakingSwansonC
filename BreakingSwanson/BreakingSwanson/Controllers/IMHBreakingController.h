//
//  IMHBreakingController.h
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMHBreakingQuote.h"

NS_ASSUME_NONNULL_BEGIN

@interface IMHBreakingController : NSObject

+(void)fetchRandomBreakingQuote:(void (^) (IMHBreakingQuote *))completion;

@end

NS_ASSUME_NONNULL_END
