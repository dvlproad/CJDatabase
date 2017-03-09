//
//  CJFileManager+SaveFileData.h
//  CommonFMDBUtilDemo
//
//  Created by lichq on 6/25/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "CJFileManager.h"

@interface CJFileManager (SaveData)

/**
 *  保存文件到以home相对的相对路径下
 *
 *  @param data                     文件数据
 *  @param fileName                 文件以什么名字保存
 *  @param relativeDirectoryPath    文件保存的相对路径
 *
 *  return 文件相对于home目录的相对路径（如果保存失败，返回nil）
 */
+ (NSString *)saveFileData:(NSData *)data
              withFileName:(NSString *)fileName
   toRelativeDirectoryPath:(NSString *)relativeDirectoryPath;

@end