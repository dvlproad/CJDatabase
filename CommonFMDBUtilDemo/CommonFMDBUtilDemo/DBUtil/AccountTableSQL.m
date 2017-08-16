//
//  AccountTableSQL.m
//  LoginDemo
//
//  Created by ciyouzen on 6/26/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "AccountTableSQL.h"

static NSString *kCurrentTableName = @"ACCOUNT";

@implementation AccountTableSQL

#pragma mark - Create
+ (NSString *)sqlForCreateTable
{
    NSString *sql = @"create table if not exists ACCOUNT (uid Text PRIMARY KEY, name TEXT, email TEXT, pasd TEXT, imageName Text, imageUrl Text, imagePath Text, modified TEXT, execTypeL Text);";
    
    return sql;
}

#pragma mark - insert

+ (NSString *)sqlForInsertInfo:(AccountInfo *)info
{
    NSAssert(info, @"info cannot be nil!");
    
    NSString *sql = [NSString stringWithFormat:
                     @"INSERT OR REPLACE INTO %@ (uid, name, email, pasd, imageName, imageUrl, imagePath, modified, execTypeL) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", kCurrentTableName, info.uid, info.name, info.email, info.pasd, info.imageName, info.imageUrl, info.imagePath, info.modified, info.execTypeL];//DB Error: 1 "unrecognized token: ":"" 即要求插入的字符串需加引号'，而对于表名，属性名，可以不用像原来那样添加。
    return sql;
}

#pragma mark - remove

+ (NSString *)sqlForRemoveInfoWhereName:(NSString *)name
{
    NSAssert(name, @"name cannot be nil!");
    
    NSString *sql = [NSString stringWithFormat:@"delete from %@ where name = '%@'",kCurrentTableName, name];
    
    return sql;
}


#pragma mark - update

+ (NSString *)sqlForUpdateInfoExceptUID:(AccountInfo *)info whereUID:(NSString *)uid
{
    NSString *sql = [NSString stringWithFormat:
                           @"UPDATE %@ SET name = '%@', email = '%@', pasd = '%@', imageName = '%@', imageUrl = '%@', imagePath = '%@' WHERE uid = '%@'", kCurrentTableName,
                     info.name, info.email, info.pasd, info.imageName, info.imageUrl, info.imagePath, uid];
    return sql;
}

+ (NSString *)sqlForUpdateInfoImagePath:(NSString *)imagePath whereUID:(NSString *)uid{
    NSString *sql = [NSString stringWithFormat:
                      @"update %@ set imagePath = '%@' where uid = '%@'", kCurrentTableName, imagePath, uid];
    return sql;
}


+ (NSString *)sqlForUpdateInfoImageUrl:(NSString *)imageUrl whereUID:(NSString *)uid{
    NSString *sql = [NSString stringWithFormat:
                     @"update %@ set imageUrl = '%@' where uid = '%@'", kCurrentTableName, imageUrl, uid];
    return sql;
}

+ (NSString *)sqlForUpdateInfoExecTypeL:(NSString *)execTypeL whereUID:(NSString *)uid{
    NSString *sql = [NSString stringWithFormat:
                     @"update %@ set execTypeL = '%@' where uid = '%@'", kCurrentTableName, execTypeL, uid];
    return sql;
}

#pragma mark - query

+ (NSString *)sqlForSelectInfoWhereUID:(NSString *)uid
{
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM %@ where uid = '%@'", kCurrentTableName, uid];
    return sql;
}

//为了在登录页面上，输入名字的时候可以显示出已经登录过的头像而加入的方法
+ (NSString *)sqlForSelectImageWhereName:(NSString *)name
{
    NSString *sql = [NSString stringWithFormat:@"SELECT imagePath FROM %@ where name = '%@'", kCurrentTableName, name];
    
    return sql;
}

@end
