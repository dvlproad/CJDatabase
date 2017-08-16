//
//  DBViewController+Event.m
//  LoginDemo
//
//  Created by ciyouzen on 6/28/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "DBViewController+Event.h"

@implementation DBViewController (Event)

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)insert:(id)sender{
    AccountInfo *info = [[AccountInfo alloc]init];
    
    info.uid = [CommonInfoHelper getUUID];
    info.name = self.tfName_insert.text;
    info.email = self.tfEmail_insert.text;
    info.pasd = @"none";
    
    info.imageName = @"none";
    info.imageUrl = @"none";
    info.imagePath = [[NSBundle mainBundle] pathForResource:@"people_test.png" ofType:nil];
    /* 两种方法获取的路径一样。读文件的时候一般用pathForResource
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    NSString * realPath = [resourcePath stringByAppendingPathComponent:@"icon.png"];
    NSLog(@"\n%@\n%@",realPath, info.imagePath);
    */
    
    info.modified = @"none";
    info.execTypeL = @"none";
    
#ifdef USE_CommonFMDBUtil
    BOOL res = [FirstFMDBFileManager insertAccountInfos:@[info]];
#else
    BOOL res = [AccountSqliteUtil insertInfo:info];
#endif
    if (res) {
        NSLog(@"添加成功");
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:info.uid forKey:@"uid"];
}

- (IBAction)delete:(id)sender{
#ifdef USE_CommonFMDBUtil
    BOOL res = [FirstFMDBFileManager removeAccountInfoWhereName:self.tfName_delete.text];
#else
    BOOL res = [AccountSqliteUtil removeInfoWhereName:self.tfName_delete.text];
#endif
    if (res) {
        NSLog(@"删除成功");
        self.tfName_delete.text = @"";
    }
}

- (IBAction)select:(id)sender{
    NSString *uid = [[NSUserDefaults standardUserDefaults] objectForKey:@"uid"];
    
#ifdef USE_CommonFMDBUtil
    NSDictionary *dic = [FirstFMDBFileManager selectAccountInfoWhereUID:uid];
    
    AccountInfo *info = [[AccountInfo alloc]init];
    
    info.uid = dic[kUser_ID];
    info.name = dic[kUser_name];
    info.email = dic[kUser_email];
    info.pasd = dic[@"pasd"];
    
    info.imageName = dic[kUser_imageName];
    info.imageUrl = dic[kUser_imageURL];
    info.imagePath = dic[@"imagePath"];
    
    info.modified = dic[kUser_Modified];
    info.execTypeL = dic[@"execTypeL"];
#else
    AccountInfo *info = [AccountSqliteUtil selectInfoWhereUID:uid];
#endif
    
    uinfo = info;
    self.tfName_update.text = uinfo.name;
    self.tfEmail_update.text = uinfo.email;
    self.tfName_delete.text = uinfo.name;
}

- (IBAction)select_OneProperty:(id)sender{
    if ([self.tfName_update.text length] == 0) {
        NSLog(@"文本框内容为空，无法搜索，请检查");
        return;
    }
#ifdef USE_CommonFMDBUtil
    UIImage *image = [FirstFMDBFileManager selectAccountImageWhereName:self.tfName_update.text];
#else
    UIImage *image = [AccountSqliteUtil selectImageWhereName:self.tfName_update.text];
#endif
    self.imageV.image = image;
}

- (IBAction)update:(id)sender{
    uinfo.name = self.tfName_update.text;
    uinfo.email = self.tfEmail_update.text;
    
#ifdef USE_CommonFMDBUtil
    BOOL res = [FirstFMDBFileManager updateAccountInfoExceptUID:uinfo whereUID:uinfo.uid];
#else
    BOOL res = [AccountSqliteUtil updateInfoExceptUID:uinfo whereUID:uinfo.uid];
#endif
    if (res) {
        NSLog(@"更新成功");
    }
}


@end
