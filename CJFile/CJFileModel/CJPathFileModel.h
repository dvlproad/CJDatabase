//
//  CJPathFileModel.h
//  CommonFMDBUtilDemo
//
//  Created by ciyouzen on 8/10/15.
//  Copyright (c) 2015 dvlproad. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, CJFileSourceType) {
    CJFileSourceTypeLocalSandbox = 1,   /**< 本地沙盒文件 */
    CJFileSourceTypeLocalBundle,    /**< 本地Bundle文件 */
    CJFileSourceTypeNetwork,        /**< 网络文件 */
};

///路径数据模型(在CJNetwork库中有一个CJUploadFileModel,这两个不一样)
@interface CJPathFileModel : NSObject {
    
}
//readonly
@property (nonatomic, assign, readonly) CJFileSourceType sourceType;
@property (nonatomic, copy, readonly) NSString *localRelativePath;/**< 本地相对路径(因为沙盒路径会变) */
//@property (nonatomic, copy, readonly) NSString *localAbsolutePath;/**< 本地绝对路径 */
@property (nonatomic, copy, readonly) NSString *networkAbsoluteUrl;/**< 网络绝对路径(有时服务器给的会是省略前缀后的) */

@property (nonatomic, copy, readonly) NSURL *absoluteURL;   /**< 不管是本地文件还是网络文件 */

#pragma mark - 网络文件的初始化方法
- (instancetype)initWithNetworkAbsoluteUrl:(NSString *)networkAbsoluteUrl;

#pragma mark - 本地文件的两种初始化方法
- (instancetype)initWithLocalRelativePath:(NSString *)localRelativePath
                               sourceType:(CJFileSourceType)sourceType;

- (instancetype)initWithLocalAbsolutePath:(NSString *)localAbsolutePath
                               sourceType:(CJFileSourceType)sourceType;

@end
