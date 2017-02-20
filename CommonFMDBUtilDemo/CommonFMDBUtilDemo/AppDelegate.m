//
//  AppDelegate.m
//  CommonFMDBUtilDemo
//
//  Created by lichq on 7/4/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "AppDelegate.h"

#ifdef USE_CommonFMDBUtil
    #import "FirstFMDBFileManager.h"
    #import "SecondFMDBFileManager.h"
    #import "CJFileManager+CalculateFileSize.h"
#else
    #import "CommonSqliteUtil.h"
#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
#ifdef DEBUG
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSLog(@"Document路径 = %@",documentsDirectory);
#endif
    
    
#ifdef USE_CommonFMDBUtil
    //CJFMDBFileDeleteResult *deleteResult = [[FirstFMDBFileManager sharedInstance] deleteCurrentFMDBFile];
    [FirstFMDBFileManager createDatabaseForUserName:@"accountDB"];
    [[SecondFMDBFileManager sharedInstance] createDatabaseWithName:@"demosqlite.db"
                                                toSubDirectoryPath:@"DB/Sqlite"
                                              byCopyBundleDatabase:@"demosqlite.db"
                                                   ifExistDoAction:CJFMDBFileExistActionTypeRerecertIt];
#else
    [CommonSqliteUtil setDataBaseName:@"demosqlite.db"];
#endif
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"demofmdb.db" ofType:nil];
    NSInteger fileSize = [CJFileManager calculateFileSizeForFilePath:path];
    NSLog(@"fileSize = %ld", fileSize);
    NSString *fileSizeString = [CJFileManager showFileSize:fileSize unitType:CJFileSizeUnitTypeBestUnit];
    NSLog(@"fileSizeString = %@", fileSizeString);
    
    NSInteger fileSize2 = [CJFileManager calculateFileSizeForFilePath:documentsDirectory];
    NSLog(@"fileSize2 = %ld", fileSize2);
    NSString *fileSizeString2 = [CJFileManager showFileSize:fileSize2 unitType:CJFileSizeUnitTypeMB];
    NSLog(@"fileSizeString2 = %@", fileSizeString2);

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
