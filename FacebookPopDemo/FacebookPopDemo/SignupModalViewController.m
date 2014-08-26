//
//  SignupModalViewController.m
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-25.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "SignupModalViewController.h"

@interface SignupModalViewController ()

@end

@implementation SignupModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.userNameTextfield) {
        self.iconUserView.image = [UIImage imageNamed:@"iconuseractive"];
        self.userNameTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
    } else if (textField == self.userEmailTextfield) {
        self.iconEmailView.image = [UIImage imageNamed:@"iconemailactive"];
        self.userEmailTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
    } else if (textField == self.userPasswordTextfield) {
        self.iconPasswordView.image = [UIImage imageNamed:@"iconpasswordactive"];
        self.userPasswordTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.userNameTextfield) {
        if ([self.userNameTextfield.text  isEqualToString: @""]) {
            self.iconUserView.image = [UIImage imageNamed:@"iconuser"];
            self.userNameTextfield.background = [UIImage imageNamed:@"icontextfield"];
        } else {
            self.iconUserView.image = [UIImage imageNamed:@"iconuseractive"];
            self.userNameTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
        }
    } else if (textField == self.userPasswordTextfield) {
        if ([self.userPasswordTextfield.text isEqualToString:@""]) {
            self.iconPasswordView.image = [UIImage imageNamed:@"iconpassword"];
            self.userPasswordTextfield.background = [UIImage imageNamed:@"icontextfield"];
        } else {
            self.iconPasswordView.image = [UIImage imageNamed:@"iconpasswordactive"];
            self.userPasswordTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
        }
    } else if (textField == self.userEmailTextfield) {
        if ([self.userEmailTextfield.text isEqualToString:@""]) {
            self.iconEmailView.image = [UIImage imageNamed:@"iconemail"];
            self.userEmailTextfield.background =[UIImage imageNamed:@"icontextfield"];
        } else {
            self.iconEmailView.image = [UIImage imageNamed:@"iconemailactive"];
            self.userEmailTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:NULL];
    return YES;
}

- (IBAction)signupButtonPressed:(id)sender
{
}
@end
