//
//  AccountSqliteUtil.m
//  LoginDemo
//
//  Created by lichq on 6/28/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "AccountSqliteUtil.h"

@implementation AccountSqliteUtil

AccountInfo* transformToInfoByStmt_pFun(sqlite3_stmt *stmt){
    int index = 0; //注意这里是0，是因为这里没有取rowid
    
    AccountInfo *info = [[AccountInfo alloc]init];
    info.uid = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.name = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.email = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.pasd = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.imageName = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.imageUrl = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.imagePath = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    
    info.modified = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.execTypeL = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.execTypeN = @"none";
    
    return info;
}

+ (AccountInfo *)transformToInfoByStmt:(sqlite3_stmt *)stmt{
    int index = 0; //注意这里是0，是因为这里没有取rowid
    
    AccountInfo *info = [[AccountInfo alloc]init];
    info.uid = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.name = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.email = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.pasd = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.imageName = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.imageUrl = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.imagePath = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    
    info.modified = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.execTypeL = [CommonSqliteUtil getTextFromStmt:stmt atIndex:index++];
    info.execTypeN = @"none";
    
    return info;
    
    //注：用到NSString stringWithUTF8String:cchar];的时候一定要判断cchar是否为空，如果为空，则该语句一定崩溃
    //延伸：由于在从数据库中，取字符串的值的时候，都要利用这个方法来完成从char *类型到NSString *到转换，所以我们可以提前在插入数据的时候进行空值的判断。
}



/*
+ (BOOL)createTable
{
    NSString *sql = @"create table if not exists ACCOUNT (uid Text PRIMARY KEY, name TEXT, email TEXT, pasd TEXT, imageName Text, imageUrl Text, imagePath Text, modified TEXT, execTypeL Text);";
    
    return [CommonSqliteUtil create:sql];
}
*/

#pragma mark - insert

+ (BOOL)insertInfo:(AccountInfo *)info
{
    NSAssert(info, @"info cannot be nil!");
    
    NSString *sql = [NSString stringWithFormat:
                     @"INSERT OR REPLACE INTO ACCOUNT (uid, name, email, pasd, imageName, imageUrl, imagePath, modified, execTypeL) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", info.uid, info.name, info.email, info.pasd, info.imageName, info.imageUrl, info.imagePath, info.modified, info.execTypeL];//DB Error: 1 "unrecognized token: ":"" 即要求插入的字符串需加引号'，而对于表名，属性名，可以不用像原来那样添加。
    
    return [CommonSqliteUtil insert:sql values:nil];
}

#pragma mark - remove

+ (BOOL)removeInfoWhereName:(NSString *)name
{
    NSAssert(name, @"name cannot be nil!");
    
    NSString *sql = [NSString stringWithFormat:@"delete from ACCOUNT where name = '%@'",name];
    
    return [CommonSqliteUtil remove:sql values:nil];
}

#pragma mark - update

+ (BOOL)updateInfoExceptUID:(AccountInfo *)info whereUID:(NSString *)uid
{
    NSAssert(info, @"info cannot be nil!");
    
    NSString *sql = [NSString stringWithFormat:
                     @"UPDATE ACCOUNT SET name = '%@', email = '%@', pasd = '%@', imageName = '%@', imageUrl = '%@', imagePath = '%@' WHERE uid = '%@'",
                     info.name, info.email, info.pasd, info.imageName, info.imageUrl, info.imagePath, uid];
    return [CommonSqliteUtil update:sql values:nil];
}

+ (BOOL)updateInfoImagePath:(NSString *)imagePath whereUID:(NSString *)uid{
    NSString *sql = [NSString stringWithFormat:
                     @"update ACCOUNT set imagePath = '%@' where uid = '%@'", imagePath, uid];
    return [CommonSqliteUtil update:sql values:nil];
}


+ (BOOL)updateInfoImageUrl:(NSString *)imageUrl whereUID:(NSString *)uid{
    NSString *sql = [NSString stringWithFormat:
                     @"update ACCOUNT set imageUrl = '%@' where uid = '%@'", imageUrl, uid];
    return [CommonSqliteUtil update:sql values:nil];
}

+ (BOOL)updateInfoExecTypeL:(NSString *)execTypeL whereUID:(NSString *)uid{
    NSString *sql = [NSString stringWithFormat:
                     @"update ACCOUNT set execTypeL = '%@' where uid = '%@'", execTypeL, uid];
    return [CommonSqliteUtil update:sql values:nil];
}

#pragma mark - query

+ (AccountInfo *)selectInfoWhereUID:(NSString *)uid
{
    NSAssert(uid, @"uid cannot be nil!");
    
    NSString *sql = [NSString stringWithFormat:@"SELECT * FROM ACCOUNT where uid = '%@'", uid];
    
    //方法①：使用block方式
    NSArray *result = [CommonSqliteUtil query:sql values:nil block:^id(sqlite3_stmt *stmt) {
        return [self transformToInfoByStmt:stmt];
    }];
    
    //方法②：使用funPoint方式
    //NSArray *result = [CommonSqliteUtil query:sql values:nil funPoint:transformToInfoByStmt_pFun];
    
    return result.count > 0 ? result[0] : nil;
}

//为了在登录页面上，输入名字的时候可以显示出已经登录过的头像而加入的方法
+ (UIImage *)selectImageWhereName:(NSString *)name
{
    NSString *sql = [NSString stringWithFormat:@"SELECT imagePath FROM ACCOUNT where name = '%@'", name];
    
    //方法①：使用block方式
    NSArray *result = [CommonSqliteUtil query:sql values:nil block:^id(sqlite3_stmt *stmt) {
        NSString *imagePath = [CommonSqliteUtil getTextFromStmt:stmt atIndex:0];
        return imagePath;
    }];
    
    NSString *imagePath = result.count > 0 ?
    result[0] : [[NSBundle mainBundle] pathForResource:@"people_logout" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
}





@end
