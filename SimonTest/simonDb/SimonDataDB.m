//
//  SimonDataDB.m
//  SimonTest
//
//  Created by Simon on 15/9/23.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SimonDataDB.h"


@implementation SimonDataDB


- (id) init {
    self = [super init];
    if (self) {
        //========== 首先查看有没有建立message的数据库，如果未建立，则建立数据库=========
        _db = [SimonManager defaultDBManager].dataBase;
        
    }
    return self;
}

/**
 * @brief 创建数据库
 */
- (void) createDataBase {
    FMResultSet * set = [_db executeQuery:[NSString stringWithFormat:@"select count(*) from sqlite_master where type ='table' and name = '%@'",kUserTableName]];
    
    [set next];
    
    NSInteger count = [set intForColumnIndex:0];
    
    BOOL existTable = !!count;
    
    if (existTable) {
        // TODO:是否更新数据库
        NSLog(@"数据库已经存在");
    } else {
        // TODO: 插入新的数据库
        NSString * sql = @"CREATE TABLE SUser (uid INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, name VARCHAR(50), description VARCHAR(100))";
        BOOL res = [_db executeUpdate:sql];
        if (!res) {
            NSLog(@"数据库创建失败");
        } else {
            NSLog(@"数据库创建成功");
        }
    }
}

@end
