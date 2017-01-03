//
//  AccountFMDBUtil.h
//  LoginDemo
//
//  Created by lichq on 6/26/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "FirstFMDBFileManager.h"
#import "AccountInfo.h"


@interface AccountFMDBUtil : NSObject

+ (BOOL)insertInfo:(AccountInfo *)info;
+ (BOOL)removeInfoWhereName:(NSString *)name;

+ (BOOL)updateInfoExceptUID:(AccountInfo *)info whereUID:(NSString *)uid;
+ (BOOL)updateInfoImagePath:(NSString *)imagePath whereUID:(NSString *)uid;
+ (BOOL)updateInfoImageUrl:(NSString *)imageUrl whereUID:(NSString *)uid;
+ (BOOL)updateInfoExecTypeL:(NSString *)execTypeL whereUID:(NSString *)uid;

+ (NSDictionary *)selectInfoWhereUID:(NSString *)uid;
+ (UIImage *)selectImageWhereName:(NSString *)name;

@end
