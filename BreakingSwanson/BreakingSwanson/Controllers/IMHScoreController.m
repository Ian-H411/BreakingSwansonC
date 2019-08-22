//
//  IMHScoreController.m
//  BreakingSwanson
//
//  Created by Ian Hall on 8/22/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "IMHScoreController.h"

@implementation IMHScoreController


+ (void)saveToPersistentStorage:(NSNumber *)highScore
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    [userdefaults setObject: highScore forKey:@"highScore"];
}

+ (NSNumber *)loadToPersistentStorage
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSNumber *highscore = [userDefaults objectForKey:@"highScore"];
    return highscore;
}
@end
