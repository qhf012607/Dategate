//
//  AppHelper.h
//  Darling
//
//  Created by jxmac2 on 16/3/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PRAppHelper : NSObject


// 压缩图片
+ (UIImage *)scaleImage:(UIImage *)image;
+ (NSData *)imageData:(UIImage *)myimage;

/**
 *  MD5加密
 *
 *  @param str 原始字符串
 *
 *  @return 加密后的字符串
 */
+ (NSString *)md5:(NSString *)str;
/**
 *  获取IP地址
 *
 *  @return ip地址
 */
+ (NSString *)getReallyIPAddress;
/**
 *  是否第一次启动
 *
 *  @return 第一次启动态
 */
+ (BOOL)isFirstLaunch;
/**
 *  获取登录态
 *
 *  @return 登录态
 */
+ (BOOL)isLogin;

/**
 *  初始化 windowRoot
 */
+ (void)initializeWindowRoot;

/**
 *  退出登录
*/
+ (void)loginOut;

/**
 显示Alert

 @param title        标题
 @param message      message
 @param doActionHandler     确定回调
 @param cancelActionHandler 取消回调
 */
+ (void)alertControllerWithTitle:(NSString *)title message:(NSString *)message doTitle:(NSString *)dotitle cancelTitle:(NSString *)cancelTitle doAction:(void (^)(UIAlertAction *action)) doActionHandler cancelAction:(void (^)(UIAlertAction *action)) cancelActionHandler;

+ (NSString *)getCurrentCache;

+ (void)clearCurrentCache;

+ (void)cornerRadiusWith:(UIView *)view;
+ (void)borderWith:(UIView *)view Color:(UIColor *)color;

+ (void)downloadWebImageWithUrlString:(NSArray *)urlArray finish:(void(^)(NSArray *images))finish;;

@end
