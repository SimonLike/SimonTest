//
//  SimonOneViewController.m
//  SimonTest
//
//  Created by Simon on 15/10/12.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SimonOneViewController.h"
#import "SimonOneSubViewController.h"
@interface SimonOneViewController ()

@end

@implementation SimonOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    SimonOneSubViewController *vc=segue.destinationViewController;
    if ([vc respondsToSelector:@selector(setSimonSrt:)]) {
        [vc setValue:@"nihao" forKey:@"simonSrt"];
    }
}


@end
