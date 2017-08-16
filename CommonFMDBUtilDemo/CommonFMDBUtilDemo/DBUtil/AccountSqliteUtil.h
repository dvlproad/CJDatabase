//
//  AccountSqliteUtil.h
//  LoginDemo
//
//  Created by ciyouzen on 6/28/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "CommonSqliteUtil.h"
#import "AccountInfo.h"

@interface AccountSqliteUtil : NSObject

+ (BOOL)insertInfo:(AccountInfo *)info;
+ (BOOL)removeInfoWhereName:(NSString *)name;

+ (BOOL)updateInfoExceptUID:(AccountInfo *)info whereUID:(NSString *)uid;
+ (BOOL)updateInfoImagePath:(NSString *)imagePath whereUID:(NSString *)uid;
+ (BOOL)updateInfoImageUrl:(NSString *)imageUrl whereUID:(NSString *)uid;
+ (BOOL)updateInfoExecTypeL:(NSString *)execTypeL whereUID:(NSString *)uid;

+ (AccountInfo *)selectInfoWhereUID:(NSString *)uid;
+ (UIImage *)selectImageWhereName:(NSString *)name;

@end
