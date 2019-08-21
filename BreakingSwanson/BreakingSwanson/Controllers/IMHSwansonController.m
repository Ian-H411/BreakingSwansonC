//
//  IMHSwansonController.m
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "IMHSwansonController.h"

@implementation IMHSwansonController


+ (void)fetchRandomSwansonQuote:(void (^)(IMHSwansonQuoteModel * _Nullable))completion;
{
    NSURL *swansonURL = [NSURL URLWithString:@"http://ron-swanson-quotes.herokuapp.com/v2/quotes"];
    
    [[NSURLSession.sharedSession dataTaskWithURL:swansonURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
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
        NSArray *arrayWithOneQuote = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        IMHSwansonQuoteModel *quote = [[IMHSwansonQuoteModel alloc] initWithQuote:arrayWithOneQuote[0]];
        NSLog(@"%@",quote.SwansonQuote);
        completion(quote);
        return;
        
    }]resume];
}

@end
