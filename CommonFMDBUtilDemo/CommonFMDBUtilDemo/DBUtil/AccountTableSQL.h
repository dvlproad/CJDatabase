//
//  AccountTableSQL.h
//  LoginDemo
//
//  Created by lichq on 6/26/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "AccountInfo.h"

@interface AccountTableSQL : NSObject

+ (NSString *)sqlForCreateTable;
+ (NSString *)sqlForInsertInfo:(AccountInfo *)info;

+ (NSString *)sqlForRemoveInfoWhereName:(NSString *)name;

//update
+ (NSString *)sqlForUpdateInfoExceptUID:(AccountInfo *)info whereUID:(NSString *)uid;
+ (NSString *)sqlForUpdateInfoImagePath:(NSString *)imagePath whereUID:(NSString *)uid;
+ (NSString *)sqlForUpdateInfoImageUrl:(NSString *)imageUrl whereUID:(NSString *)uid;
+ (NSString *)sqlForUpdateInfoExecTypeL:(NSString *)execTypeL whereUID:(NSString *)uid;

//query
+ (NSString *)sqlForSelectInfoWhereUID:(NSString *)uid;
+ (NSString *)sqlForSelectImageWhereName:(NSString *)name;

@end
