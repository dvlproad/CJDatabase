//
//  CJFMDBFileManager.h
//  CommonFMDBUtilDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "CJFileManager.h"

/**
 *  数据库文件管理类（每个数据库的管理类都必须继承此类，并实现单例方法）
 */
@interface CJFMDBFileManager : CJFileManager {
    
}
@property (nonatomic, copy, readonly) NSString *databaseDirectory;
@property (nonatomic, copy, readonly) NSString *databaseName;

#pragma mark - 创建数据库、数据表
/**
 *  复制数据库到某个目录下(如果已存在则会报错)
 *
 *  @param databaseName         要复制的数据库的名字
 *  @param subDirectoryPath     复制数据库到哪里
 */
- (BOOL)copyBundleDatabase:(NSString *)databaseName
        toSubDirectoryPath:(NSString *)subDirectoryPath;

/**
 *  复制数据库到某个目录下
 *
 *  @param databaseName         要复制的数据库的名字
 *  @param subDirectoryPath     复制数据库到哪里
 *  @param ifExistDeleteFirst   如果存在是否先删除
 */
- (BOOL)copyBundleDatabase:(NSString *)databaseName
        toSubDirectoryPath:(NSString *)subDirectoryPath
        ifExistDeleteFirst:(BOOL)ifExistDeleteFirst;

/**
 *  创建数据库(如果已存在则会报错)
 *
 *  @param databaseName         数据库名字
 *  @param subDirectoryPath     数据库所在目录
 *  @param createTableSqls      数据表的创建语句
 */
- (void)createDatabaseWithName:(NSString *)databaseName
              subDirectoryPath:(NSString *)subDirectoryPath
               createTableSqls:(NSArray<NSString *> *)createTableSqls;

/**
 *  创建数据库
 *
 *  @param databaseName         数据库名字
 *  @param subDirectoryPath     数据库所在目录
 *  @param createTableSqls      数据表的创建语句
 *  @param ifExistDeleteFirst   如果存在是否先删除
 */
- (void)createDatabaseWithName:(NSString *)databaseName
              subDirectoryPath:(NSString *)subDirectoryPath
               createTableSqls:(NSArray<NSString *> *)createTableSqls
            ifExistDeleteFirst:(BOOL)ifExistDeleteFirst;

#pragma mark - 删除数据库目录/数据库文件
/**
 *  删除当前数据库文件（清除缓存的时候使用）
 *
 *  return 是否删除成功
 */
- (BOOL)deleteCurrentFMDBFile;

/**
 *  删除数据库所在的文件夹（应用更新的时候使用）
 *
 *  return 是否删除成功
 */
- (BOOL)deleteCurrentFMDBDirectory;

#pragma mark - 数据库表操作
- (BOOL)create:(NSString *)sql;

- (BOOL)insert:(NSString *)sql;

- (BOOL)remove:(NSString *)sql;

- (BOOL)update:(NSString *)sql;

- (NSMutableArray *)query:(NSString *)sql;

@end
