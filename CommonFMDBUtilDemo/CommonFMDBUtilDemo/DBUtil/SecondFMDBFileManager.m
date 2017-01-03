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

@end
