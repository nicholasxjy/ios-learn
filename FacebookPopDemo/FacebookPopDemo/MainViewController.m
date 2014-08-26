//
//  MainViewController.m
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-25.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "MainViewController.h"
#import "ChameleonFramework/Chameleon.h"
#import "pop/POP.h"
#import "LoginModalViewController.h"
#import "SignupModalViewController.h"
#import "PresentAnimator.h"
#import "DismissingAnimator.h"

@interface MainViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    POPSpringAnimation *topViewAnimation = [POPSpringAnimation animation];
    topViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
    topViewAnimation.fromValue = @(self.view.frame.origin.y);
    topViewAnimation.toValue = @(self.view.frame.origin.y + 104);
    topViewAnimation.springSpeed = 10;
    topViewAnimation.springBounciness = 20;
    topViewAnimation.name = @"slideIn";
    [self.topTitleView pop_addAnimation:topViewAnimation forKey:@"titleSlideIn"];
    
    POPSpringAnimation *middleActionViewAnimation = [POPSpringAnimation animation];
    middleActionViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewScaleXY];
    middleActionViewAnimation.fromValue = [NSValue valueWithCGSize:CGSizeMake(2, 2)];
    middleActionViewAnimation.toValue = [NSValue valueWithCGSize:CGSizeMake(1, 1)];
    middleActionViewAnimation.springBounciness = 10;
    middleActionViewAnimation.name = @"fadeIn";
    [self.middleActionView pop_addAnimation:middleActionViewAnimation forKey:@"middleActionFadeIn"];
    
    POPSpringAnimation *bottomViewAnimation = [POPSpringAnimation animation];
    bottomViewAnimation.property = [POPAnimatableProperty propertyWithName:kPOPLayerPositionY];
    bottomViewAnimation.fromValue = @(self.view.frame.size.height + 90);
    bottomViewAnimation.toValue = @(505);
    bottomViewAnimation.springSpeed = 5;
    bottomViewAnimation.springBounciness = 20;
    bottomViewAnimation.name = @"slideUp";
    [self.bottomRightView pop_addAnimation:bottomViewAnimation forKey:@"titleSlideIn"];
    
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

#pragma mark - set Light statusbar
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonPressed:(UIButton *)sender
{
    UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LoginModalViewController *loginModalViewController = [loginStoryboard instantiateViewControllerWithIdentifier:@"loginModalViewStoryboard"];
    loginModalViewController.modalPresentationStyle = UIModalPresentationCustom;
    loginModalViewController.transitioningDelegate = self;
    [self presentViewController:loginModalViewController
                                            animated:YES
                                         completion:NULL];
}

- (IBAction)signupButtonPressed:(id)sender
{
    UIStoryboard *signUpStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    SignupModalViewController *signUpModalViewController = [signUpStoryboard instantiateViewControllerWithIdentifier:@"signUpModalViewStoryboard"];
    signUpModalViewController.transitioningDelegate = self;
    signUpModalViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:signUpModalViewController animated:YES completion:NULL];
}
@end
