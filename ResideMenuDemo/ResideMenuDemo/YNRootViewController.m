//
//  YNRootViewController.m
//  ResideMenuDemo
//
//  Created by nicholas on 14-8-24.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "YNRootViewController.h"
#import "ChameleonFramework/Chameleon.h"




@interface YNRootViewController ()

@end

@implementation YNRootViewController


-(void)awakeFromNib
{
    self.contentViewShadowColor = [UIColor blackColor];
    self.contentViewShadowOffset = CGSizeMake(0, 0);
    self.contentViewShadowOpacity = 0.6;
    self.contentViewShadowRadius = 12;
    self.contentViewShadowEnabled = YES;
    
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerContentController"];
    self.leftMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftSideMenuController"];
    self.rightMenuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"rightSideMenuController"];
    self.backgroundImage = [UIImage imageNamed:@"bg-2"];
    self.delegate = self;
    
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - RESideMenu Delegate

- (void)sideMenu:(RESideMenu *)sideMenu willShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didShowMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didShowMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu willHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"willHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

- (void)sideMenu:(RESideMenu *)sideMenu didHideMenuViewController:(UIViewController *)menuViewController
{
    NSLog(@"didHideMenuViewController: %@", NSStringFromClass([menuViewController class]));
}

@end
