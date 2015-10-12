//
//  SimonOneSubViewController.m
//  SimonTest
//
//  Created by Simon on 15/10/12.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SimonOneSubViewController.h"

@interface SimonOneSubViewController ()

@end

@implementation SimonOneSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"SimonSrtviewDidLoad-->%@",_simonSrting);


}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"SimonSrt-->%@",self.simonSrt);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setSimonSrt:(NSString *)simonSrt{
    self.simonSrting=simonSrt;
    NSLog(@"SimonSrt----->%@",simonSrt);

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
