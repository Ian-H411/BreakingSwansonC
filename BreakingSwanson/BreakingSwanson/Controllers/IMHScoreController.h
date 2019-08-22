//
//  IMHScoreController.h
//  BreakingSwanson
//
//  Created by Ian Hall on 8/22/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MainViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface IMHScoreController : NSObject

+(void)saveToPersistentStorage:(NSNumber *)highScore;

+(NSNumber *)loadToPersistentStorage;

@end

NS_ASSUME_NONNULL_END
