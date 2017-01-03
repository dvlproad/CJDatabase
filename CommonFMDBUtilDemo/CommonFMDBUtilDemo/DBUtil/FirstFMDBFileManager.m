//
//  FirstFMDBFileManager.m
//  CommonFMDBUtilDemo
//
//  Created by dvlproad on 2016/12/21.
//  Copyright © 2016年 ciyouzen. All rights reserved.
//

#import "FirstFMDBFileManager.h"

@implementation FirstFMDBFileManager

+ (FirstFMDBFileManager *)sharedInstance {
    static FirstFMDBFileManager *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

@end
