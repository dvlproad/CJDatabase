//
//  FirstFMDBFileManager.m
//  CommonFMDBUtilDemo
//
//  Created by dvlproad on 2016/12/21.
//  Copyright © 2016年 ciyouzen. All rights reserved.
//

#import "FirstFMDBFileManager.h"

@implementation FirstFMDBFileManager

+ (FirstFMDBFileManager *)sharedInstance {
    static FirstFMDBFileManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+ (void)createDatabaseForUserName:(NSString *)userName {
    NSAssert(userName != nil && [userName length] > 0, @"userName不能为空");
    
    [[FirstFMDBFileManager sharedInstance] cancelManagerAnyDatabase];
    
    NSString *databaseName = @"";
    if ([userName hasSuffix:@".db"]) {
        databaseName = userName;
    } else {
        databaseName = [NSString stringWithFormat:@"%@.db", userName];
    }
    
    NSString *directoryRelativePath = [CJFileManager getLocalDirectoryPathType:CJLocalPathTypeRelative
                                                            bySubDirectoryPath:@"DB/Account"
                                                         inSearchPathDirectory:NSDocumentDirectory
                                                               createIfNoExist:YES];
    NSString *fileRelativePath = [directoryRelativePath stringByAppendingPathComponent:databaseName];
    
    //方法1：copy
    NSString *copyDatabasePath = [[NSBundle mainBundle] pathForResource:@"demofmdb.db" ofType:nil];
    [[FirstFMDBFileManager sharedInstance] createDatabaseInFileRelativePath:fileRelativePath
                                                         byCopyDatabasePath:copyDatabasePath
                                                            ifExistDoAction:CJFMDBFileExistActionTypeUseOld];
    
    //方法2:create
    /*
    NSArray *createTableSqls = [self allCreateTableSqls];
    
    [[FirstFMDBFileManager sharedInstance] createDatabaseInFileRelativePath:fileRelativePath
                                                          byCreateTableSqls:createTableSqls
                                                            ifExistDoAction:CJFMDBFileExistActionTypeRerecertIt];
    */
}

+ (NSArray *)allCreateTableSqls {
    NSString *sqlUserTabelCreate = [AccountTableSQL sqlForCreateTable];
    
    NSArray *createTableSqls = @[sqlUserTabelCreate];
    
    return createTableSqls;
}

+ (void)reCreateCurrentDatabase {
    NSArray *createTableSqls = [self allCreateTableSqls];
    [[FirstFMDBFileManager sharedInstance] recreateDatabase:createTableSqls];
}

+ (BOOL)deleteFMDBDirectory {
    return [[FirstFMDBFileManager sharedInstance] deleteCurrentFMDBDirectory];
}


#pragma mark - AccountTable
+ (BOOL)insertAccountInfos:(NSArray<AccountInfo *> *)infos {
    NSMutableArray *sqls = [[NSMutableArray alloc] init];
    for (AccountInfo *info in infos) {
        NSString *sql = [AccountTableSQL sqlForInsertInfo:info];
        [sqls addObject:sql];
    }
    
    return [[FirstFMDBFileManager sharedInstance] cjExecuteUpdate:sqls useTransaction:YES];
}

+ (BOOL)removeAccountInfoWhereName:(NSString *)name {
    NSString *sql = [AccountTableSQL sqlForRemoveInfoWhereName:name];
    return [[FirstFMDBFileManager sharedInstance] cjExecuteUpdate:@[sql]];
}

//update
+ (BOOL)updateAccountInfoExceptUID:(AccountInfo *)info whereUID:(NSString *)uid {
    NSString *sql = [AccountTableSQL sqlForUpdateInfoExceptUID:info whereUID:uid];
    return [[FirstFMDBFileManager sharedInstance] cjExecuteUpdate:@[sql]];
}

+ (BOOL)updateAccountInfoImagePath:(NSString *)imagePath whereUID:(NSString *)uid {
    NSString *sql = [AccountTableSQL sqlForUpdateInfoImageUrl:imagePath whereUID:uid];
    return [[FirstFMDBFileManager sharedInstance] cjExecuteUpdate:@[sql]];
}

+ (BOOL)updateAccountInfoImageUrl:(NSString *)imageUrl whereUID:(NSString *)uid {
    NSString *sql = [AccountTableSQL sqlForUpdateInfoImageUrl:imageUrl whereUID:uid];
    return [[FirstFMDBFileManager sharedInstance] cjExecuteUpdate:@[sql]];
}

+ (BOOL)updateAccountInfoExecTypeL:(NSString *)execTypeL whereUID:(NSString *)uid {
    NSString *sql = [AccountTableSQL sqlForUpdateInfoExecTypeL:execTypeL whereUID:uid];
    return [[FirstFMDBFileManager sharedInstance] cjExecuteUpdate:@[sql]];
}

//query
+ (NSDictionary *)selectAccountInfoWhereUID:(NSString *)uid {
    NSString *sql = [AccountTableSQL sqlForSelectInfoWhereUID:uid];
    
    NSArray *result = [[FirstFMDBFileManager sharedInstance] query:sql];
    return result.count > 0 ? result[0] : nil;
}

+ (UIImage *)selectAccountImageWhereName:(NSString *)name
{
    NSString *sql = [AccountTableSQL sqlForSelectImageWhereName:name];
    
    NSArray *result = [[FirstFMDBFileManager sharedInstance] query:sql];
    NSString *imagePath = result.count > 0 ?
    [result[0] objectForKey:@"imagePath"] : [[NSBundle mainBundle] pathForResource:@"people_logout" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];
    
    return image;
}




@end
