//
//  CJFMDBFileManager.h
//  CommonFMDBUtilDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "CJFileManager.h"

@interface CJFMDBFileManager : CJFileManager {
    
}
@property (nonatomic, copy) NSString *databaseDirectory;
@property (nonatomic, copy) NSString *databaseName;
@property (nonatomic, copy) NSString *currentDatabasePath;/**< 当前数据库路径 */

/**
 *  创建单例
 *
 *  @return 单例
 */
+ (CJFMDBFileManager *)sharedInstance;

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


/**
 *  复制数据库到某个目录下
 *
 *  @param databaseName     要复制的数据库的名字
 *  @param subDirectoryPath 复制数据库到哪里
 */
- (void)copyDatabaseWithName:(NSString *)databaseName
          toSubDirectoryPath:(NSString *)subDirectoryPath;

/**
 *  创建数据库
 *
 *  @param databaseName         数据库名字
 *  @param subDirectoryPath     数据库所在目录
 *  @param createTableSqls      数据表的创建语句
 */
- (void)createDatabaseWithName:(NSString *)databaseName
              subDirectoryPath:(NSString *)subDirectoryPath
               createTableSqls:(NSArray<NSString *> *)createTableSqls;

@end
