//
//  SignupModalViewController.h
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-25.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignupModalViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *userNameTextfield;
@property (weak, nonatomic) IBOutlet UIImageView *iconUserView;
@property (weak, nonatomic) IBOutlet UITextField *userEmailTextfield;
@property (weak, nonatomic) IBOutlet UIImageView *iconEmailView;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTextfield;
@property (weak, nonatomic) IBOutlet UIImageView *iconPasswordView;
- (IBAction)signupButtonPressed:(id)sender;

@end
