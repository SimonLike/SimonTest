//
//  SimonViewController.m
//  SimonTest
//
//  Created by Simon on 15/9/22.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SimonViewController.h"
#import "TestViewController.h"
#import "UIImageView+WebCache.h"

@interface SimonViewController ()<UITextViewDelegate,UITextFieldDelegate>

@end

@implementation SimonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.textView.delegate=self;
    self.textFiled.delegate=self;
    [self.imageUrl sd_setImageWithURL:[NSURL URLWithString:@"http://wx.dudubashi.com/image/v2/banner/invite_20150825.jpg"] placeholderImage:[UIImage imageNamed:@""]];
   
    UIGestureRecognizer *singleTap =  [[UIGestureRecognizer alloc]initWithTarget:self action:@selector(UesrClicked)];
    
    [self.imageUrl addGestureRecognizer:singleTap];
    
}
-(void)UesrClicked{
    
    UIImageWriteToSavedPhotosAlbum(self.imageUrl.image,self,@selector(image:didFinishSavingWithError:contextInfo:),NULL);
}



//指定回调方法

-(void)image:(UIImage*)image didFinishSavingWithError:(NSError*)error contextInfo:(void*)contextInfo
{
    
    if(!error){
        
        NSLog(@"savesuccess");
        
    }else{
        
        NSLog(@"savefailed");
        
    }
    
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
    [self UesrClicked];
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
