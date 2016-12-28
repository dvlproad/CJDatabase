//
//  CJFMDBFileManager.m
//  CommonFMDBUtilDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "CJFMDBFileManager.h"
#import "FMDB.h"

@implementation CJFMDBFileManager

/** 完整的描述请参见文件头部 */
+ (CJFMDBFileManager *)sharedInstance {
    static CJFMDBFileManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

#pragma mark - 文件操作
/** 完整的描述请参见文件头部 */
- (BOOL)deleteCurrentFMDBFile {
    NSString *fileName = self.databaseName;
    NSString *subDirectoryPath = self.databaseDirectory;
    
//    NSString *filePath = [CJFileManager getFilePathWithFileName:fileName
//                                               subDirectoryPath:subDirectoryPath
//                                          inSearchPathDirectory:NSDocumentDirectory];
    NSString *filePath = [self getDatabasePathWithName:fileName
                                      subDirectoryPath:subDirectoryPath];
    if ([filePath length] == 0) {
        NSLog(@"%@文件不存在，默认删除成功", fileName);
    }
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL deleteFileSuccess = [fileManager removeItemAtPath:filePath error:nil];
    if (deleteFileSuccess) {
        self.databaseName = nil;
    }
    return deleteFileSuccess;
}

/** 完整的描述请参见文件头部 */
- (BOOL)deleteCurrentFMDBDirectory {
    NSString *subDirectoryPath = self.databaseDirectory;
    
    BOOL deleteDirectorySuccess = [CJFileManager deleteDirectoryBySubDirectoryPath:subDirectoryPath inSearchPathDirectory:NSDocumentDirectory];
    if (deleteDirectorySuccess) {
        self.databaseDirectory = nil;
        self.databaseName = nil;
    }
    
    return deleteDirectorySuccess;
}


#pragma mark - 创建数据库方法1
/** 完整的描述请参见文件头部 */
- (void)copyDatabaseWithName:(NSString *)databaseName
            toSubDirectoryPath:(NSString *)subDirectoryPath {
    [self setDatabaseWithName:databaseName subDirectoryPath:subDirectoryPath copy:YES];
}

/**
 *  设置数据库
 *
 *  @param databaseName     数据库名字
 *  @param subDirectoryPath subDirectoryPath
 *  @param isCopy           是否复制
 */
- (void)setDatabaseWithName:(NSString *)databaseName
           subDirectoryPath:(NSString *)subDirectoryPath
                       copy:(BOOL)isCopy {
    NSAssert(databaseName, @"name cannot be nil!");
    
    self.databaseName = databaseName;
    self.databaseDirectory = subDirectoryPath;
    
    NSString *databasePath = [self getDatabasePathWithName:databaseName
                                          subDirectoryPath:subDirectoryPath];
    [CJFMDBFileManager sharedInstance].currentDatabasePath = databasePath;
    
    if (isCopy) {
        if(![[NSFileManager defaultManager] fileExistsAtPath:databasePath]) {
            NSString *bundlePath = [[NSBundle mainBundle] pathForResource:databaseName ofType:nil];//注意如果bundlePath == nil,那请检查Build Phases下的Copy Bundle Resources中是不是没有添加该资源
            if ([[NSFileManager defaultManager] fileExistsAtPath:bundlePath]) {
                [[NSFileManager defaultManager] copyItemAtPath:bundlePath toPath:databasePath error:nil];
            }
            else {
                NSAssert(NO, @"%@ does not exist!", databaseName);
            }
        }
    }
}

#pragma mark - 创建数据库方法2
/** 完整的描述请参见文件头部 */
- (void)createDatabaseWithName:(NSString *)databaseName
              subDirectoryPath:(NSString *)subDirectoryPath
               createTableSqls:(NSArray<NSString *> *)createTableSqls {
    
    self.databaseName = databaseName;
    self.databaseDirectory = subDirectoryPath;
    
    NSString *databasePath = [self getDatabasePathWithName:databaseName
                                          subDirectoryPath:subDirectoryPath];
    [CJFMDBFileManager sharedInstance].currentDatabasePath = databasePath;
    
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:databasePath]) {
        NSLog(@"数据库已存在");
        
    } else {
        NSLog(@"还未创建数据库，现在正在创建数据库");
        
        FMDatabase *db = [FMDatabase databaseWithPath:databasePath];
        if ([db open]) { //执行open的时候，如果数据库不存在则会自动创建
            for (NSString *createTableSql in createTableSqls) {
                BOOL result = [db executeUpdate:createTableSql];
                if (result == NO) {
                    NSLog(@"操作数据表失败:%@", createTableSql);
                }
            }
            
            [db close];
            
        } else {
            NSLog(@"database open error");
        }
    }
}

#pragma mark - Private
- (NSString *)currentDatabasePath {
    if (_currentDatabasePath && [_currentDatabasePath length] > 0) {
        return _currentDatabasePath;
    }
    
    NSString *databaseName = self.databaseName;
    NSString *subDirectoryPath = self.databaseDirectory;
    
    NSString *databaseDirectory = [CJFileManager getDirectoryPathBySubDirectoryPath:subDirectoryPath inSearchPathDirectory:NSDocumentDirectory createIfNoExist:YES];
    NSString *databasePath = [databaseDirectory stringByAppendingPathComponent:databaseName];
    _currentDatabasePath = databasePath;
    
    return _currentDatabasePath;
}


/**
 *  获取数据库路径
 *
 *  @param databaseName         数据库名字
 *  @param subDirectoryPath     子文件夹的路径/名字(可多层xx/yy，也可为空)
 *
 *  return 数据库路径
 */

- (NSString *)getDatabasePathWithName:(NSString *)databaseName
                     subDirectoryPath:(NSString *)subDirectoryPath {
    NSString *databaseDirectory = [CJFileManager getDirectoryPathBySubDirectoryPath:subDirectoryPath inSearchPathDirectory:NSDocumentDirectory createIfNoExist:YES];
    NSString *databasePath = [databaseDirectory stringByAppendingPathComponent:databaseName];
    NSLog(@"数据库路径 = %@", databasePath);
    
    return databasePath;
}

@end
