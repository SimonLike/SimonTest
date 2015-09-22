//
//  SimonViewController.m
//  SimonTest
//
//  Created by Simon on 15/9/22.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SimonViewController.h"
#import "TestViewController.h"

@interface SimonViewController ()

@end

@implementation SimonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonClick:(id)sender {
    TestViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]
                                          instantiateViewControllerWithIdentifier:@"TestView"];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
