//
//  ViewController.m
//  DeleteAddCell
//
//  Created by nicholas on 14-7-22.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navgationItem.rightBarButtonItem = self.editButtonItem;
    self.navgationItem.title = @"单元格插入和删除";
    
    self.txtField.hidden = YES;
    self.txtField.delegate = self;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.listTeams = [[NSMutableArray alloc] initWithObjects:@"黑龙江",@"吉林",@"辽宁", nil];
    
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    [self.tableView setEditing:editing animated:YES];
    if (editing) {
        self.txtField.hidden = NO;
    } else {
        self.txtField.hidden = YES;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.listTeams count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *Cellidentifier = @"cell";
    BOOL b_addCell = (indexPath.row == self.listTeams.count);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:Cellidentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Cellidentifier];
    }
    if (!b_addCell) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [self.listTeams objectAtIndex:indexPath.row];
    } else {
        self.txtField.frame = CGRectMake(10, 0, 300, 44);
        self.txtField.text = @"";
        [cell.contentView addSubview:self.txtField];
    }
    return cell;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == self.listTeams.count) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.listTeams removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [self.listTeams insertObject:self.txtField.text atIndex:[self.listTeams count]];
        [self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self.tableView reloadData];
    }
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [self.listTeams count]) {
        return NO;
    } else {
        return YES;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    UITableViewCell *cell = [(UITableViewCell *)[textField superview] superview];
    [self.tableView setContentOffset:CGPointMake(0.0, cell.frame.origin.y) animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
