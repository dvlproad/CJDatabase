//
//  FirstFMDBFileManager.h
//  CommonFMDBUtilDemo
//
//  Created by ciyouzen on 2016/12/21.
//  Copyright © 2016年 dvlproad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJFMDBFileManager.h"
#import "AccountTableSQL.h"

@interface FirstFMDBFileManager : CJFMDBFileManager

+ (FirstFMDBFileManager *)sharedInstance;

+ (void)createDatabaseForUserName:(NSString *)userName;

+ (void)reCreateCurrentDatabase;

+ (BOOL)deleteFMDBDirectory;



#pragma mark - AccountTable
+ (BOOL)insertAccountInfos:(NSArray<AccountInfo *> *)infos;
+ (BOOL)removeAccountInfoWhereName:(NSString *)name;

//update
+ (BOOL)updateAccountInfoExceptUID:(AccountInfo *)info whereUID:(NSString *)uid;
+ (BOOL)updateAccountInfoImagePath:(NSString *)imagePath whereUID:(NSString *)uid;
+ (BOOL)updateAccountInfoImageUrl:(NSString *)imageUrl whereUID:(NSString *)uid;
+ (BOOL)updateAccountInfoExecTypeL:(NSString *)execTypeL whereUID:(NSString *)uid;

//query
+ (NSDictionary *)selectAccountInfoWhereUID:(NSString *)uid;
+ (UIImage *)selectAccountImageWhereName:(NSString *)name;

@end
