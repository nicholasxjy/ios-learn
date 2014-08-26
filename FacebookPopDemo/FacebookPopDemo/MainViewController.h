//
//  MainViewController.h
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-25.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *topTitleView;
@property (weak, nonatomic) IBOutlet UIView *middleActionView;
@property (weak, nonatomic) IBOutlet UIView *bottomRightView;
- (IBAction)loginButtonPressed:(id)sender;

- (IBAction)signupButtonPressed:(id)sender;

@end
