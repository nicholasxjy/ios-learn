//
//  ViewController.m
//  TextKitDemo
//
//  Created by nicholas on 14-7-23.
//  Copyright (c) 2014年 nicholas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect textViewRect = CGRectInset(self.view.bounds, 10.0, 20.0);
    NSTextStorage *textStorage = [[NSTextStorage alloc] initWithString:_textView.text];
    NSLayoutManager *layoutManager = [[NSLayoutManager alloc] init];
    [textStorage addLayoutManager:layoutManager];
    
    _textContainer = [[NSTextContainer alloc] initWithSize:textViewRect.size];
    [layoutManager addTextContainer:_textContainer];
    
    [_textView removeFromSuperview];
    _textView = [[UITextView alloc] initWithFrame:textViewRect textContainer:_textContainer];
    [self.view addSubview:_textView];
    [textStorage beginEditing];
    NSDictionary *attrsDict = @{NSTextEffectAttributeName: NSTextEffectLetterpressStyle};
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:_textView.text attributes:attrsDict];
    [textStorage setAttributedString:attrStr];
    [self markWord:@"我" inTextStorage:textStorage];
    [self markWord:@"i" inTextStorage:textStorage];
    [textStorage endEditing];
    
}

- (void)markWord:(NSString *)word inTextStorage:(NSTextStorage *)textStorage
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:word options:0 error:nil];
    NSArray *matches = [regex matchesInString:_textView.text options:0 range:NSMakeRange(0, [_textView.text length])];
    
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match range];
        [textStorage addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:matchRange];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
