//
//  LoginModalViewController.m
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-25.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "LoginModalViewController.h"
#import "ChameleonFramework/Chameleon.h"
#import "pop/POP.h"
#import "ForgetPassModalViewController.h"
#import "PresentAnimator.h"
#import "DismissingAnimator.h"

@interface LoginModalViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation LoginModalViewController

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
    if (textField == self.userNameTextField) {
        self.userNameIcon.image = [UIImage imageNamed:@"iconuseractive"];
        self.userNameTextField.background = [UIImage imageNamed:@"icontextfieldactive"];
    } else if (textField == self.passwordTextField) {
        self.passwordIcon.image = [UIImage imageNamed:@"iconpasswordactive"];
        self.passwordTextField.background = [UIImage imageNamed:@"icontextfieldactive"];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.userNameTextField) {
        if ([self.userNameTextField.text  isEqualToString: @""]) {
            self.userNameIcon.image = [UIImage imageNamed:@"iconuser"];
            self.userNameTextField.background = [UIImage imageNamed:@"icontextfield"];
        } else {
            self.userNameIcon.image = [UIImage imageNamed:@"iconuseractive"];
            self.userNameTextField.background = [UIImage imageNamed:@"icontextfieldactive"];
        }
    } else if (textField == self.passwordTextField) {
        if ([self.passwordTextField.text isEqualToString:@""]) {
            self.passwordIcon.image = [UIImage imageNamed:@"iconpassword"];
            self.passwordTextField.background = [UIImage imageNamed:@"icontextfield"];
        } else {
            self.passwordIcon.image = [UIImage imageNamed:@"iconpasswordactive"];
            self.passwordTextField.background = [UIImage imageNamed:@"icontextfieldactive"];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:NULL];
    return YES;
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [PresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissingAnimator new];
}


- (IBAction)forgetPassButtonPressed:(id)sender
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ForgetPassModalViewController *forgetPassModalViewController = [storyboard instantiateViewControllerWithIdentifier:@"forgetPassModalViewStoryboard"];
    forgetPassModalViewController.transitioningDelegate = self;
    forgetPassModalViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:forgetPassModalViewController animated:YES completion:NULL];
}

- (IBAction)loginCheck:(id)sender
{
}
@end
