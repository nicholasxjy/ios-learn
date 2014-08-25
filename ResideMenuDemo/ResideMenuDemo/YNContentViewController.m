//
//  YNContentViewController.m
//  ResideMenuDemo
//
//  Created by nicholas on 14-8-24.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "YNContentViewController.h"
#import "ChameleonFramework/Chameleon.h"
#import "VBFPopFlatButton.h"
#import "RESideMenu.h"

@interface YNContentViewController ()
@property (nonatomic, strong) VBFPopFlatButton *leftButton;
@end

@implementation YNContentViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor flatBlackColor];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor flatNavyBlueColorDark];
    self.navigationItem.title = @"Yes or No";
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 44)];
    titleLabel.text = @"Yes or No";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:20];
    titleLabel.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = titleLabel;
    
    self.leftButton = [[VBFPopFlatButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20) buttonType:buttonMenuType buttonStyle:buttonPlainStyle];
    self.leftButton.lineThickness = 2;
    self.leftButton.linesColor = [UIColor whiteColor];
    [self.leftButton addTarget:self action:@selector(leftMenuButtonPressed:) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];

    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
    [rightButton setBackgroundImage:[UIImage imageNamed:@"notification"] forState:UIControlStateNormal];
    rightButton.contentMode = UIViewContentModeScaleAspectFill;
    rightButton.backgroundColor = [UIColor clearColor];
    [rightButton addTarget:self action:@selector(notificationButtonPressed:) forControlEvents:UIControlEventTouchDown];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];

}

-(void)leftMenuButtonPressed:(VBFPopFlatButton *)sender
{
    [self.sideMenuViewController presentLeftMenuViewController];
}

- (void)notificationButtonPressed:(UIButton *)sender
{
    NSLog(@"notification pressed");
}

@end
