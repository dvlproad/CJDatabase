//
//  CommonFMDBUtil.h
//  CommonFMDBUtilDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CJFMDBFileManager.h"

@interface CommonFMDBUtil : NSObject {
    
}

+ (BOOL)create:(NSString *)sql;

+ (BOOL)insert:(NSString *)sql;

+ (BOOL)remove:(NSString *)sql;

+ (BOOL)update:(NSString *)sql;

+ (NSMutableArray *)query:(NSString *)sql;

@end
