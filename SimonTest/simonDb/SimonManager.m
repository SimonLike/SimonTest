//
//  SimonManager.m
//  SimonTest
//
//  Created by Simon on 15/9/23.
//  Copyright (c) 2015年 Simon. All rights reserved.
//

#import "SimonManager.h"

#import "FMDatabase.h"

#define kDefaultDBName @"simon.sqlite"

@interface SimonManager ()

@end

@implementation SimonManager


static SimonManager * _sharedDBManager;

+ (SimonManager *) defaultDBManager {
    if (!_sharedDBManager) {
        _sharedDBManager = [[SimonManager alloc] init];
    }
    return _sharedDBManager;
}

/**
 * @brief 创建数据库
 */
- (void) createDataBase {
    
    // 沙盒Docu目录
    NSString * docp = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    _name = [docp stringByAppendingString:[NSString stringWithFormat:@"/%@",kDefaultDBName]];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL exist = [fileManager fileExistsAtPath:_name];
    [self connect];
    if (!exist) {
        NSString * sql = @"CREATE TABLE SimonModel (uid INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, name VARCHAR(50), description VARCHAR(100))";
        //        NSString * sql = @"CREATE TABLE SimonModel (Model)";
        BOOL res = [_dataBase executeUpdate:sql];
        if (!res) {
            NSLog(@"数据库创建失败@@");
        } else {
            NSLog(@"数据库创建成功@@");
        }
    } else {
        NSLog(@"数据库已经存在");
       // 返回 数据库已经存在
    }

    NSLog(@"_databasePath->%@",_dataBase.databasePath);
}
/**
 * @brief 创建表
 */
-(void)createDataTable{
    
    if ([_dataBase open]) {
        NSString *sqlCreateTable =  [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS '%@' ('%@' INTEGER PRIMARY KEY AUTOINCREMENT, '%@' TEXT, '%@' INTEGER, '%@' TEXT)",@"class",@"ID",@"text",@"ste",@"ste"];
        
        BOOL res = [_dataBase executeUpdate:sqlCreateTable];
        if (!res) {
            NSLog(@"error when creating db table");
        } else {
            NSLog(@"success to creating db table");
        }
        [_dataBase close];
    }
    
}

- (void) dealloc {
    [self close];
}

- (id) init {
    self = [super init];
    if (self) {
    }
    return self;
}

/**
 * @brief 初始化数据库操作
 * @param name 数据库名称
 * @return 返回数据库初始化状态， 0 为 已经存在，1 为创建成功，-1 为创建失败
 */
- (int) initializeDBWithName : (NSString *) name {
    if (!name) {
        return -1;  // 返回数据库创建失败
    }
    // 沙盒Docu目录
    NSString * docp = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    _name = [docp stringByAppendingString:[NSString stringWithFormat:@"/%@",name]];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL exist = [fileManager fileExistsAtPath:_name];
    [self connect];
    if (!exist) {
        return 0;
    } else {
        return 1;          // 返回 数据库已经存在
    }
    
}

/// 连接数据库
- (void) connect {
    if (!_dataBase) {
        _dataBase = [[FMDatabase alloc] initWithPath:_name];
    }
    if (![_dataBase open]) {
        NSLog(@"不能打开数据库");
    }
}
/// 关闭连接
- (void) close {
    [_dataBase close];
    _sharedDBManager = nil;
}

@end
