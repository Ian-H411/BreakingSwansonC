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

@property (weak, nonatomic) IBOutlet UIButton *submitAnswerLabel;

/*
  things i want to add
 1. an alert for when the buttons are unselected good to go!!
 2. change the submit button to match their choice
 3. a way to blank out the previous message until its loaded !!implemented
 4. a way to lock responses until loaded !! done
 5. smooth out edges
 6. pics for the buttons
 7. change all these yes statements to a bool
 */


@end

@implementation MainViewController



//MARK: - lifecycle
- (void)viewDidLoad {
    self.quoteLabel.text = @"loading next question please wait";
    [super viewDidLoad];
    [[self submitAnswerLabel] setTitle:@"PICK AN ANSWER FIRST" forState:UIControlStateNormal];
    [self fetchDataUpdateLabels];
    
}
//MARK: -helper functions

- (void)fetchDataUpdateLabels
{
    NSUInteger num = arc4random_uniform(2);
    if (num == 0)
    {
        [IMHSwansonController fetchRandomSwansonQuote:^(IMHSwansonQuoteModel *quoteSwanson) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.quoteLabel.text = quoteSwanson.SwansonQuote;
                self.isRonSwanson = @"yes";
                self.isQuestionLocked = @"no";
            });
            
        }];
    } else {
        [IMHBreakingController fetchRandomBreakingQuote:^(IMHBreakingQuote *quoteBreaking) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.quoteLabel.text = quoteBreaking.breakingQuote;
                self.isRonSwanson = @"no";
                self.isQuestionLocked = @"no";
            });;
        }];
    }
}


- (void)checkUsersAnswer:(NSString *)usersanswer
{
    if (usersanswer == self.isRonSwanson)
    {
        self.currentScore ++;
        self.currentScoreLabel.text = [NSString stringWithFormat:@"%ld",self.currentScore];
        self.quoteLabel.text = @"loading next question please wait";
        [self correctAnswerAlert];
        self.usersAnswer = @"undecided";
    } else
    {
        self.currentScore = 0;
        self.currentScoreLabel.text = [NSString stringWithFormat:@"%ld",self.currentScore];
        self.quoteLabel.text = @"loading next question please wait";
        [self incorrectAnswerAlert];
        self.usersAnswer = @"undecided";
    }
    [[self submitAnswerLabel] setTitle:@"PICK AN ANSWER FIRST" forState:UIControlStateNormal];
}
- (void)userNeedsToSelectanAnswerAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"ummmm" message:@"hey there we need ya to pick an answer first" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"okay understood" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)incorrectAnswerAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"incorrect" message:@"try again" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"next question" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)correctAnswerAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"correct" message:@"you got that one right lets go on to the next" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"next question" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}



//MARK: - ACTIONS

- (IBAction)breakingBadButtonTapped:(id)sender {
    if ([[self isQuestionLocked]  isEqual: @"no"])
    {
    self.usersAnswer = @"no";
        [[self submitAnswerLabel] setTitle:@"BREAKING BAD" forState:UIControlStateNormal];
    }
}

- (IBAction)ronSwansonButtonTapped:(id)sender {
    if ([[self isQuestionLocked]  isEqual: @"no"])
    {
    self.usersAnswer = @"yes";
        [[self submitAnswerLabel] setTitle:@"RON SWANSON" forState:UIControlStateNormal];
    }
}

- (IBAction)submitAnswerButtonTapped:(id)sender {
    if ([[self isQuestionLocked]  isEqual: @"no"])
    {
    if (_usersAnswer != nil){
        [self checkUsersAnswer: _usersAnswer ];
        self.isQuestionLocked = @"yes";
        [self fetchDataUpdateLabels];
    }
    }
}

@end
