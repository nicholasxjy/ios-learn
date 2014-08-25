//
//  YNLeftSideMenuViewController.m
//  ResideMenuDemo
//
//  Created by nicholas on 14-8-24.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "YNLeftSideMenuViewController.h"
#import "RESideMenu.h"
#import "LBBlurredImage/UIImageView+LBBlurredImage.h"



@interface YNLeftSideMenuViewController ()

@property (nonatomic, strong) UIImage *backgroundImage;
@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *blurImageView;

@property (nonatomic, strong) UIView *leftSideMenuTopView;
@property (nonatomic, strong) UITableView *leftSideMenuTableView;
@property (nonatomic, strong) UIImageView *userAvatarImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *userGenderLabel;
@property (nonatomic, strong) UILabel *userProfileLabel;
@property (nonatomic, strong) UIButton *userSettingButton;
@property (nonatomic, strong) UILabel *userLocationLabel;

@end

@implementation YNLeftSideMenuViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // todo first if user logged in
    // get the user info and set item info to the item
    // now i set the default
    
#define TOP_MARGIN 44
#define LEFT_MARGIN 30
#define LINE_WIDTH 150
#define TABLE_CELL_HEIGHT 54
    
    self.view.backgroundColor = [UIColor clearColor];
    // add table view
    
    self.leftSideMenuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, TOP_MARGIN, self.view.frame.size.width, self.view.frame.size.height-TOP_MARGIN-TOP_MARGIN) style:UITableViewStylePlain];
    self.leftSideMenuTableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.leftSideMenuTableView];
    
    self.leftSideMenuTableView.delegate = self;
    self.leftSideMenuTableView.dataSource = self;
    self.leftSideMenuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //[self setUserInfo];
    self.leftSideMenuTopView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 70)];
    
    // set top view inside
    UIImage *avatar = [UIImage imageNamed:@"default"];
    self.userAvatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(LEFT_MARGIN, 0, 60, 60)];
    self.userAvatarImageView.image = avatar;
    self.userAvatarImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.userAvatarImageView.layer.cornerRadius = self.userAvatarImageView.frame.size.height / 2;
    self.userAvatarImageView.layer.masksToBounds = YES;
    self.userAvatarImageView.layer.borderWidth = 0;
    [self.leftSideMenuTopView addSubview:self.userAvatarImageView];
    
    self.userNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_MARGIN+60+10, 10, self.view.frame.size.width, 14)];
    self.userNameLabel.text = @"Nicholas Xue";
    self.userNameLabel.backgroundColor = [UIColor clearColor];
    self.userNameLabel.textColor = [UIColor whiteColor];
    self.userNameLabel.textAlignment = NSTextAlignmentCenter;
    self.userNameLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    [self.userNameLabel sizeToFit];
    [self.leftSideMenuTopView addSubview:self.userNameLabel];
    
    self.userGenderLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_MARGIN+60+10, 35, self.view.frame.size.width, 12)];
    self.userGenderLabel.text = @"男";
    self.userGenderLabel.backgroundColor = [UIColor clearColor];
    self.userGenderLabel.textColor = [UIColor whiteColor];
    self.userGenderLabel.textAlignment = NSTextAlignmentCenter;
    self.userGenderLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [self.userGenderLabel sizeToFit];
    [self.leftSideMenuTopView addSubview:self.userGenderLabel];
    
    
    self.userLocationLabel = [[UILabel alloc] initWithFrame:CGRectMake(LEFT_MARGIN+60+20+10, 35, self.view.frame.size.width, 12)];
    self.userLocationLabel.text = @"上海";
    self.userLocationLabel.backgroundColor = [UIColor clearColor];
    self.userLocationLabel.textColor = [UIColor whiteColor];
    self.userLocationLabel.textAlignment = NSTextAlignmentCenter;
    self.userLocationLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    [self.userLocationLabel sizeToFit];
    [self.leftSideMenuTopView addSubview:self.userLocationLabel];
    
    
    self.leftSideMenuTableView.tableHeaderView = self.leftSideMenuTopView;

    
    
}


#pragma mark - UI set





#pragma mark -
#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"leftSideMenuController"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        case 1:
            [self.sideMenuViewController setContentViewController:[[UINavigationController alloc] initWithRootViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"rightSideMenuController"]]
                                                         animated:YES];
            [self.sideMenuViewController hideMenuViewController];
            break;
        default:
            break;
    }
}

#pragma mark -
#pragma mark UITableView Datasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.backgroundColor = [UIColor clearColor];
        cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
        cell.textLabel.textColor = [UIColor whiteColor];
        cell.textLabel.highlightedTextColor = [UIColor lightGrayColor];
        cell.selectedBackgroundView = [[UIView alloc] init];
    }
    
    NSArray *titles = @[@"Home", @"Friends", @"Questions", @"Settings", @"Log Out"];
    NSArray *images = @[@"iconhome", @"iconfriends", @"iconquestions", @"iconsetting", @"iconlogout"];
    cell.textLabel.text = titles[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:images[indexPath.row]];
    cell.layer.position = CGPointMake(30, 0);
    return cell;
}


- (IBAction)userSettingButtonClick:(id)sender
{
}
@end
