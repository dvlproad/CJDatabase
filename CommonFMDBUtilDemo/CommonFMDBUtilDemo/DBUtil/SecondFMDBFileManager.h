//
//  SecondFMDBFileManager.h
//  CommonFMDBUtilDemo
//
//  Created by ciyouzen on 2017/1/3.
//  Copyright © 2017年 dvlproad. All rights reserved.
//

#import "CJFMDBFileManager.h"

@interface SecondFMDBFileManager : CJFMDBFileManager

+ (SecondFMDBFileManager *)sharedInstance;

+ (void)createDatabaseForUserName:(NSString *)userName;

@end
