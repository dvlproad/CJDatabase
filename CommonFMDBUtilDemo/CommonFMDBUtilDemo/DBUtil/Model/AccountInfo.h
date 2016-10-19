//
//  AccountInfo.h
//  LoginDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommonInfoHelper.h"

#define kUser_ID        @"uid"
#define kUser_name      @"name"
#define kUser_email     @"email"
#define kUser_imageName @"avantar_name"
#define kUser_imageURL  @"avantar"

#define kUser_Modified  @"modified"

@interface AccountInfo : NSObject

@property(nonatomic, strong) NSString *uid;
@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *email;
@property(nonatomic, strong) NSString *pasd;
@property(nonatomic, strong) NSString *imageName;
@property(nonatomic, strong) NSString *imageUrl;
@property(nonatomic, strong) NSString *imagePath;

@property(nonatomic, strong) NSString *modified;
@property(nonatomic, strong) NSString *execTypeL;
@property(nonatomic, strong) NSString *execTypeN;

+ (AccountInfo *)turnToStructFromStandardDic:(NSDictionary *)dic_user;

@end
