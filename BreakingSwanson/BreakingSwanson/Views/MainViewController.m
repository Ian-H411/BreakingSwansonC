//
//  MainViewController.m
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
//MARK: -outlets

@property (weak, nonatomic) IBOutlet UILabel *quoteLabel;

@property (weak, nonatomic) IBOutlet UILabel *highScoreLabel;

@property (weak, nonatomic) IBOutlet UILabel *currentScoreLabel;


@end

@implementation MainViewController




//MARK: - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
//MARK: -helper functions

- (void)fetchDataUpdateLabels
{
    NSUInteger num = arc4random_uniform(1);
    if (num == 0)
    {
        [IMHSwansonController fetchRandomSwansonQuote:^(IMHSwansonQuoteModel *quoteSwanson) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.quoteLabel.text = quoteSwanson.SwansonQuote;
                self.isRonSwanson = @"yes";
            });
            
        }];
    } else {
        [IMHBreakingController fetchRandomBreakingQuote:^(IMHBreakingQuote *quoteBreaking) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.quoteLabel.text = quoteBreaking.breakingQuote;
                self.isRonSwanson = @"no";
            });;
        }];
    }
}

- (void)checkUsersAnswer:(NSString *)usersanswer
{
    if (usersanswer == self.isRonSwanson)
    {
        self.currentScore = self.currentScore + 1;
        self.currentScoreLabel.text = [NSString stringWithFormat:@"%ld",self.currentScore];
    } else
    {
        self.currentScoreLabel = 0;
        self.currentScoreLabel.text = [NSString stringWithFormat:@"%ld",self.currentScore];
    }
}





//MARK: - ACTIONS

- (IBAction)breakingBadButtonTapped:(id)sender {
    checkusersAnswer
    
}

- (IBAction)ronSwansonButtonTapped:(id)sender {
}

- (IBAction)submitAnswerButtonTapped:(id)sender {
}

@end
