//
//  IMHSwansonController.h
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMHSwansonQuoteModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface IMHSwansonController : NSObject

+(void)fetchRandomSwansonQuote:(void (^) (IMHSwansonQuoteModel *))completion;

@end

NS_ASSUME_NONNULL_END
