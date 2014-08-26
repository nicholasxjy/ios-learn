//
//  ForgetPassModalViewController.m
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-26.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "ForgetPassModalViewController.h"
#import "PresentAnimator.h"
#import "DismissingAnimator.h"

@interface ForgetPassModalViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation ForgetPassModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

#pragma mark - UITextfield delegate
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.forgetPassEmailTextfield) {
        self.forgetPassEmailTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
    }
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.forgetPassEmailTextfield) {
        if ([self.forgetPassEmailTextfield.text isEqualToString:@""]) {
            self.forgetPassEmailTextfield.background = [UIImage imageNamed:@"icontextfield"];
        } else {
            self.forgetPassEmailTextfield.background = [UIImage imageNamed:@"icontextfieldactive"];
        }
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:NULL];
    return YES;
}

- (IBAction)forgetPassButtonCheck:(id)sender
{
    
}

- (IBAction)forgetPassCancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
@end
