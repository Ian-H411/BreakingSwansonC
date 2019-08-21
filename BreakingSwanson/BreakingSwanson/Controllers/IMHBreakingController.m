//
//  IMHBreakingController.m
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "IMHBreakingController.h"

@implementation IMHBreakingController

+ (void)fetchRandomBreakingQuote:(void (^)(IMHBreakingQuote * _Nullable))completion
{
    NSURL *breakingURL = [NSURL URLWithString:@"https://breaking-bad-quotes.herokuapp.com/v1/quotes"];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:breakingURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error)
        {
            NSLog(@"%@",error);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"%@",error);
            completion(nil);
            return;
        }
        NSArray *quoteAsArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        NSDictionary *quoteDictionary = quoteAsArray[0];
        NSString *quoteString = quoteDictionary[@"quote"];
        IMHBreakingQuote *quote = [[IMHBreakingQuote alloc] initWithQuote:quoteString];
        NSLog(@"%@",quote.breakingQuote);
        completion(quote);
        return;
        
    }]resume];
}

@end
