//
//  CommunaUit.h
//  SimonTest
//
//  Created by Simon on 15/10/10.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 设备信号版本
 */
#define IPhone5 (([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO)

#define IPhone6 (667 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)

#define IPhone6plus (736 == [[UIScreen mainScreen] bounds].size.height ? YES : NO)
/*
 手机系统版本
 */
#define NoDeviece7  [[UIDevice currentDevice].systemVersion doubleValue]>=7.2f
/*
 字体大小
 */
#define systemFont(f) [UIFont systemFontOfSize:f]

#define boldSystemFont(f) [UIFont boldSystemFontOfSize:f]
/*
 RGB颜色
 */
#define RGB(r,g,b)  [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

