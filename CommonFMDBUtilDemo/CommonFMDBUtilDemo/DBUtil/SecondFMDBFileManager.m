//
//  SecondFMDBFileManager.m
//  CommonFMDBUtilDemo
//
//  Created by dvlproad on 2017/1/3.
//  Copyright © 2017年 ciyouzen. All rights reserved.
//

#import "SecondFMDBFileManager.h"

@implementation SecondFMDBFileManager

+ (SecondFMDBFileManager *)sharedInstance {
    static SecondFMDBFileManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

+ (void)createDatabaseForUserName:(NSString *)userName {
    NSAssert(userName != nil && [userName length] > 0, @"userName不能为空");
    
    NSString *databaseName = @"";
    if ([userName hasSuffix:@".db"]) {
        databaseName = userName;
    } else {
        databaseName = [NSString stringWithFormat:@"%@.db", userName];
    }
    
    NSString *directoryRelativePath = [CJFileManager getLocalDirectoryPathType:CJLocalPathTypeRelative
                                                            bySubDirectoryPath:@"DB/Sqlite"
                                                         inSearchPathDirectory:NSDocumentDirectory
                                                               createIfNoExist:YES];
    NSString *fileRelativePath = [directoryRelativePath stringByAppendingPathComponent:databaseName];
    
    //方法1：copy
    NSString *copyDatabasePath = [[NSBundle mainBundle] pathForResource:@"demosqlite.db" ofType:nil];
    [[SecondFMDBFileManager sharedInstance] createDatabaseInFileRelativePath:fileRelativePath
                                                          byCopyDatabasePath:copyDatabasePath
                                                             ifExistDoAction:CJFileExistActionRerecertIt];
}

@end
