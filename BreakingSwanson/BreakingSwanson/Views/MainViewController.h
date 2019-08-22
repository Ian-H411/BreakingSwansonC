//
//  MainViewController.h
//  BreakingSwanson
//
//  Created by Ian Hall on 8/21/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IMHSwansonController.h"
#import "IMHBreakingController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : UIViewController

-(void)fetchDataUpdateLabels;

-(void)checkUsersAnswer:(NSString *)usersanswer;

-(void)correctAnswerAlert;

-(void)incorrectAnswerAlert;

-(void)userNeedsToSelectanAnswerAlert;

@property (nonatomic) NSString *isRonSwanson;

@property (nonatomic) NSInteger currentScore;

@property (nonatomic, copy) NSString *usersAnswer;

@property (nonatomic) NSString *isQuestionLocked;

@end

NS_ASSUME_NONNULL_END
