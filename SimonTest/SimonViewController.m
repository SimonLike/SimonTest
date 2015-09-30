//
//  SimonViewController.m
//  SimonTest
//
//  Created by Simon on 15/9/22.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SimonViewController.h"
#import "TestViewController.h"

@interface SimonViewController ()<UITextViewDelegate,UITextFieldDelegate>

@end

@implementation SimonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView.delegate=self;
    self.textFiled.delegate=self;

    NSString *conStr=@"sdfsdad\ndsafasd\n15";

    NSString *content = [conStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqual:@"\n"]) {
        NSLog(@"text-->%@",text);
    }
    
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"range--->%d",range.location);
    NSLog(@"string--->%@",string);
    
    NSString *text = [textField text];
   
    text = [text stringByReplacingOccurrencesOfString:@" " withString:@""];

    if (string.length <= 0)
    {
        return YES;
    }
    
    if (textField.text.length >= 13) {
        return NO;
    }
    NSMutableString *strings = [[NSMutableString alloc] initWithString:text];
    if (text.length >= 3)
    {
        [strings insertString:@" " atIndex:3];
    }
    if (text.length >= 7)
    {
        [strings insertString:@" " atIndex:8];
    }
    self.textFiled.text = strings;

    return YES;
}
- (IBAction)buttonClick:(id)sender {
    NSString *content = [self.textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSLog(@"text-->%@",content);

//    TestViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
//                                          instantiateViewControllerWithIdentifier:@"TestView"];
//    [self.navigationController pushViewController:vc animated:YES];
//    
//    __weak typeof(self) weakSelf=self;//避免block 循环缓存
//    
//    vc.testViewBlock=^(NSString *str){
//        NSLog(@"s--->%@",str);
//        [weakSelf.navigationController popViewControllerAnimated:YES];
//    };
}
@end
