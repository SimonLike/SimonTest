//
//  SimonViewController.h
//  SimonTest
//
//  Created by Simon on 15/9/22.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SimonViewController : UIViewController
- (IBAction)buttonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textFiled;

@end
