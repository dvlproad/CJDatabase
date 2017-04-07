//
//  CJImageFileModel.h
//  CommonFMDBUtilDemo
//
//  Created by dvlproad on 8/10/15.
//  Copyright (c) 2015 ciyouzen. All rights reserved.
//

#import "CJFileModel.h"
#import <UIKit/UIKit.h>

@interface CJImageFileModel : CJFileModel

- (void)cj_getImageWithCompleteBlock:(void(^)(UIImage *image))completeBlock;


@end
