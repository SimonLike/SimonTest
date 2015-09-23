//
//  TestViewController.h
//  SimonTest
//
//  Created by Simon on 15/9/22.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TestViewblock)(NSString *str);

@interface TestViewController : UIViewController

@property(nonatomic,copy)TestViewblock testViewBlock;

- (IBAction)back:(id)sender;

@end
