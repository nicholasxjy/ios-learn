//
//  ViewController.h
//  TextKitDemo
//
//  Created by nicholas on 14-7-23.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSTextContainer *textContainer;

@property (weak, nonatomic) IBOutlet UITextView *textView;

- (void)markWord:(NSString *)word inTextStorage:(NSTextStorage *)textStorage;

@end
