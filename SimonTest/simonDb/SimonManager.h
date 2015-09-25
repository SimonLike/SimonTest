//
//  SimonManager.h
//  SimonTest
//
//  Created by Simon on 15/9/23.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabaseAdditions.h"

#define kUserTableName @"SimonModels"

@class FMDatabase;

/**
 * @brief 对数据链接进行管理，包括链接，关闭连接
 * 可以建立长连接 长连接
 */

@interface SimonManager : NSObject{
    NSString * _name;
}

- (void) createDataBase;

/// 数据库操作对象，当数据库被建立时，会存在次至
@property (nonatomic, readonly) FMDatabase * dataBase;  // 数据库操作对象
/// 单例模式
+(SimonManager *) defaultDBManager;

// 关闭数据库
- (void) close;


-(void)createDataTable;

@end
