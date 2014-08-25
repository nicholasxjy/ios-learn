//
//  YNLeftSideMenuViewController.h
//  ResideMenuDemo
//
//  Created by nicholas on 14-8-24.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"


@interface YNLeftSideMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>


- (IBAction)userSettingButtonClick:(id)sender;

@end
