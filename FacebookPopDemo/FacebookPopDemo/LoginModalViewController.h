//
//  LoginModalViewController.h
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-25.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginModalViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *loginModalView;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
- (IBAction)forgetPassButtonPressed:(id)sender;
- (IBAction)loginCheck:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *userNameIcon;
@property (weak, nonatomic) IBOutlet UIImageView *passwordIcon;

@end
