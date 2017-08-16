//
//  CJImageFileModel.m
//  CommonFMDBUtilDemo
//
//  Created by dvlproad on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import "CJImageFileModel.h"

@implementation CJImageFileModel

/* 完整的描述请参见文件头部 */
- (void)cj_getImageWithCompleteBlock:(void(^)(UIImage *image))completeBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSData *imageData = [NSData dataWithContentsOfURL:self.absoluteURL];//如果图片尚未加载完成不会执行程序的下一步
        if (imageData == nil) {
            NSLog(@"Error:imageFileModel的absoluteURL获取到的数据为空");
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            if (completeBlock) {
                completeBlock(image);
            }
        });
    });
}


@end
