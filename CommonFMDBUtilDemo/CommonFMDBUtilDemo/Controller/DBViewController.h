//
//  DBViewController.h
//  LoginDemo
//
//  Created by lichq on 6/28/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <UIKit/UIKit.h>

#ifdef USE_CommonFMDBUtil
    #import "FirstFMDBFileManager.h"
#else
    #import "AccountSqliteUtil.h"
#endif

@interface DBViewController : UIViewController{
    AccountInfo *uinfo;
}
@property(nonatomic, strong) IBOutlet UITextField *tfName_insert;
@property(nonatomic, strong) IBOutlet UITextField *tfEmail_insert;

@property(nonatomic, strong) IBOutlet UITextField *tfName_delete;

@property(nonatomic, strong) IBOutlet UITextField *tfName_update;
@property(nonatomic, strong) IBOutlet UITextField *tfEmail_update;

@property(nonatomic, weak) IBOutlet UIImageView *imageV;

@end
