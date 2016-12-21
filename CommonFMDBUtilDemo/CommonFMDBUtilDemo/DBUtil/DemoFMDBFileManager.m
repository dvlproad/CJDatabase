//
//  DemoFMDBFileManager.m
//  CommonFMDBUtilDemo
//
//  Created by 李超前 on 2016/12/21.
//  Copyright © 2016年 ciyouzen. All rights reserved.
//

#import "DemoFMDBFileManager.h"
#import "CJFMDBFileManager.h"

@implementation DemoFMDBFileManager

+ (void)createDatabase:(NSString *)databaseName {
    [[CJFMDBFileManager sharedInstance] copyDatabaseWithName:databaseName toSubDirectoryPath:nil];
}

@end
