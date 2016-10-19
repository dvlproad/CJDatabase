//
//  AccountInfo.m
//  LoginDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "AccountInfo.h"

@implementation AccountInfo
@synthesize uid;
@synthesize name;
@synthesize email;
@synthesize pasd;
@synthesize imageName;
@synthesize imageUrl;
@synthesize imagePath;

/*
+ (NSString *)tableName
{
    return @"ACCOUNT";
}

+ (NSString *)create_sql{
    NSString *sql = @"create table if not exists ACCOUNT (uid Text PRIMARY KEY, name TEXT, email TEXT, pasd TEXT, imageName Text, imageUrl Text, imagePath Text, modified TEXT, execTypeL Text);";
    return sql;
}

- (NSString *)insert_sql{
    NSString *sql = [NSString stringWithFormat:
                     @"INSERT OR REPLACE INTO %@ (uid, name, email, pasd, imageName, imageUrl, imagePath, modified, execTypeL) VALUES ('%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@', '%@')", [[self class] tableName], self.uid, self.name, self.email, self.pasd, self.imageName, self.imageUrl, self.imagePath, self.modified, self.execTypeL];//DB Error: 1 "unrecognized token: ":"" 即要求插入的字符串需加引号'，而对于表名，属性名，可以不用像原来那样添加。
    return sql;
}
*/

//从服务器返回的标准dic结构，转为自定义的结构体(此时不处理图片的保存，否则会造成因图片加载慢而卡顿，图片的保存放在要显示的时候才加载)
+ (AccountInfo *)turnToStructFromStandardDic:(NSDictionary *)dic_user{//注意这个方法没法取得name，因为服务器没返回
    AccountInfo *info = [[AccountInfo alloc]init];
    
    info.uid = [dic_user stringValueForKeyPath:kUser_ID];
    /* //name、pasd通过其他方法得到
     info.name = [dic_user valueForKeyPath:kUser_name];
     info.pasd = @"no_read";
     */
    info.email = [dic_user valueForKeyPath:kUser_email];
    
    info.imageName = [dic_user valueForKeyPath:kUser_imageName];
    info.imageUrl = [dic_user valueForKeyPath:kUser_imageURL];
    if ([info.imageUrl isEqualToString:@""]) {
        //后台没有提供默认头像，所以这里我们假设用户自己在前台设置了头像，且头像内容为默认图片
        info.imageUrl = kNoData;
        info.imagePath = [[NSBundle mainBundle] pathForResource:@"people_default" ofType:@"png"];;
        info.imageName = @"people_default";
        
        info.execTypeL = execTypeUpdate;
        info.execTypeN = execTypeNone;
    }else{
        //如果后台有图片，则默认前台没有下载，即前台imagePath = kNoData;
        info.imagePath = kNoData;
        info.imageName = kNoData;
        
        info.execTypeL = execTypeNone;
        info.execTypeN = execTypeUpdate;//user 没有is_delete
    }
    
    info.modified = [[dic_user valueForKeyPath:kUser_Modified] stringValue];
    
    
    
    return info;
}





@end
