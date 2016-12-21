//
//  CommonFMDBUtil.m
//  CommonFMDBUtilDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "CommonFMDBUtil.h"
//#import <FMDB/FMDB.h>
#import "FMDB.h"

@implementation CommonFMDBUtil

#pragma mark - create

+ (BOOL)create:(NSString *)sql
{
    NSAssert(sql, @"sql cannot be nil!");
    
    return [self executeUpdate:sql args:nil];
}


#pragma mark - insert

+ (BOOL)insert:(NSString *)sql
{
    NSAssert(sql, @"sql cannot be nil!");
    
    return [self executeUpdate:sql args:nil];
}

#pragma mark - remove

+ (BOOL)remove:(NSString *)sql
{
    NSAssert(sql, @"sql cannot be nil!");
    
    return [self executeUpdate:sql args:nil];
}

#pragma mark - update

+ (BOOL)update:(NSString *)sql
{
    NSAssert(sql, @"sql cannot be nil!");
    
    return [self executeUpdate:sql args:nil];
}



#pragma mark - query

+ (NSMutableArray *)query:(NSString *)sql
{
    NSAssert(sql, @"sql cannot be nil!");
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    FMDatabase *db = [FMDatabase databaseWithPath:[self dbPath]];
    
    if ([db open]) {
        FMResultSet *rs = [db executeQuery:sql];
        while ([rs next]) {
            [result addObject:[rs resultDictionary]];
        }
        
        [db close];
    }
    
    db = nil;
    
    return result;
}



#pragma mark - private method

+ (BOOL)executeUpdate:(NSString *)sql args:(NSArray *)args
{
    BOOL success = NO;
    
    FMDatabase *db = [FMDatabase databaseWithPath:[self dbPath]];
    
    if ([db open]) {
        success = [db executeUpdate:sql withArgumentsInArray:args];
        
        [db close];
    }
    
    db = nil;
    
    return success;
}

+ (NSString *)dbPath {
    return [CJFMDBFileManager sharedInstance].currentDatabasePath;
}

@end
