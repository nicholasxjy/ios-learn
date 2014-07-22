//
//  XYViewController.m
//  ModalViewDemo
//
//  Created by nicholas on 14-7-22.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "XYViewController.h"

@interface XYViewController ()

@end

@implementation XYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(registerCompletion:) name:@"RegisterCompletionNotification" object:nil];
}

- (void)registerCompletion:(NSNotification *)notification
{
    NSDictionary *theData = [notification userInfo];
    NSString *username = [theData objectForKey:@"username"];
    NSLog(@"username = %@", username);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)regonclick:(id)sender
{
    NSBundle *bundle = [NSBundle mainBundle];
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:bundle];
    UIViewController *registerViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"registerViewController"];
    registerViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:registerViewController animated:YES completion:^{
        NSLog(@"Present Modal View");
    }];
}
@end
