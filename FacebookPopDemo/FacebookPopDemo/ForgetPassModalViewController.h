//
//  ForgetPassModalViewController.h
//  FacebookPopDemo
//
//  Created by nicholas on 14-8-26.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForgetPassModalViewController : UIViewController <UITextFieldDelegate>
- (IBAction)forgetPassButtonCheck:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *forgetPassEmailTextfield;

@end
