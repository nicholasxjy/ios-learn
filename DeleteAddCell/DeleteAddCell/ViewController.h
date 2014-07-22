//
//  ViewController.h
//  DeleteAddCell
//
//  Created by nicholas on 14-7-22.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *navgationItem;
@property (strong, nonatomic) IBOutlet UITextField *txtField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *listTeams;

@end

