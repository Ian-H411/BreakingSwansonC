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
@property (weak, nonatomic) IBOutlet UIButton *breakingBadButtonLabel;
@property (weak, nonatomic) IBOutlet UIButton *ronSwansonButtonLabel;


@end

@implementation MainViewController



//MARK: - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set quote default label
    self.quoteLabel.text = @"loading next question please wait";
    //set answer button text
    [[self submitAnswerLabel] setTitle:@"PICK AN ANSWER FIRST" forState:UIControlStateNormal];
    
    //load data
    NSNumber *highScoreLoaded = [IMHScoreController loadToPersistentStorage];
    
    //set high score
    self.highScore = [NSNumber numberWithInteger:[highScoreLoaded intValue]];
    
    //set the high score text label
    self.highScoreLabel.text = [NSString stringWithFormat: @"%@", [self highScore]];
    //label formatting
    self.quoteLabel.layer.cornerRadius = 8;
    self.submitAnswerLabel.layer.cornerRadius = 8;
    self.ronSwansonButtonLabel.layer.cornerRadius = 8;
    self.breakingBadButtonLabel.layer.cornerRadius = 8;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:true];
    //i want this started asap because of how slow it is
    [self fetchDataUpdateLabels];
}
//MARK: -helper functions

- (void)fetchDataUpdateLabels
{
    //random num generator to pick between the 2 options
    NSUInteger num = arc4random_uniform(2);
    if (num == 0)
    {
        //fetch swanson quote and set labels as well as unlock stuff
        [IMHSwansonController fetchRandomSwansonQuote:^(IMHSwansonQuoteModel *quoteSwanson) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.quoteLabel.text = quoteSwanson.SwansonQuote;
                self.isRonSwanson = @"yes";
                self.isQuestionLocked = @"no";
            });
            
        }];
    } else {
        //fetch breaking bad quote and then set text and unlock
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
    //check if answer is correct
    if (usersanswer == self.isRonSwanson)
    {
        //set my ticking value
        NSNumber *one = @1;
        //up my value by one
        self.currentScore  = [NSNumber numberWithInteger:([one intValue] + [self.currentScore intValue])];
        //set labels and push alert
        self.currentScoreLabel.text = [NSString stringWithFormat:@"%@",self.currentScore];
        self.quoteLabel.text = @"loading next question please wait";
        [self correctAnswerAlert];
        self.usersAnswer = @"undecided";
        //check if the current answer is better than the high score
        if ([self.currentScore intValue] > [self.highScore intValue])
        {
            self.highScore = self.currentScore;
            self.highScoreLabel.text =  [NSString stringWithFormat:@"%@",self.highScore];
            [IMHScoreController saveToPersistentStorage:self.highScore];
        }
    } else
    {
        //if there answer is incorrect set current score to 0
        self.currentScore = @0;
        //update labels and prepare
        self.currentScoreLabel.text = [NSString stringWithFormat:@"%@",self.currentScore];
        self.quoteLabel.text = @"loading next question please wait";
        [self incorrectAnswerAlert];
        self.usersAnswer = @"undecided";
    }
    //reset submit button text
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

//alert to let user know their answer was incorrect
- (void)incorrectAnswerAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"incorrect" message:@"try again" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"next question" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:action];
    [self presentViewController:alert animated:YES completion:nil];
}
//alert that shows the answer is correct
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
