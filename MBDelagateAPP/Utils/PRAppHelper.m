//
//  AppHelper.m
//  Darling
//
//  Created by jxmac2 on 16/3/24.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "PRAppHelper.h"
#import <CommonCrypto/CommonDigest.h>
#import "SDImageCache.h"
#import "SDWebImageDownloader.h"
@implementation PRAppHelper

+ (UIImage *)scaleImage:(UIImage *)image
{
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data = UIImageJPEGRepresentation(image, 0.1);
        }else if (data.length>512*1024) {//0.5M-1M
            data = UIImageJPEGRepresentation(image, 0.5);
        }else if (data.length>200*1024) {//0.25M-0.5M
            data = UIImageJPEGRepresentation(image, 0.9);
        }
    }
    return [UIImage imageWithData:data];
}
//压缩图片
+ (NSData *)imageData:(UIImage *)myimage
{
    NSData *data=UIImageJPEGRepresentation(myimage, 1.0);
    //    NSLog(@"该个图片压缩前data=%ld",data.length);
    //    NSLog(@"该张图片压缩前data为=%.2fM",data.length/1024.0/1024.0);
    if (data.length>100*1024) {
        if (data.length>1024*1024) {//1M以及以上
            data=UIImageJPEGRepresentation(myimage, 0.1);
        }else if (data.length>512*1024) {//0.5M-1M
            data=UIImageJPEGRepresentation(myimage, 0.5);
        }else if (data.length>200*1024) {//0.25M-0.5M
            data=UIImageJPEGRepresentation(myimage, 0.9);
        }
    }
    //    NSLog(@"该个图片压缩后data=%ld",data.length);
    //    NSLog(@"该张图片压缩后data为=%.2fM",data.length/1024.0/1024.0);
    return data;
}


+ (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    NSString * string =  [NSString stringWithFormat:
                          @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
                          result[0], result[1], result[2], result[3],
                          result[4], result[5], result[6], result[7],
                          result[8], result[9], result[10], result[11],
                          result[12], result[13], result[14], result[15]
                          ];
    return string;
}

+ (NSString *)getReallyIPAddress
{
    NSError *error;
    NSURL *ipURL = [NSURL URLWithString:@"https://pv.sohu.com/cityjson?ie=utf-8"];
    NSMutableString *ip = [NSMutableString stringWithContentsOfURL:ipURL encoding:NSUTF8StringEncoding error:&error];
    //判断返回字符串是否为所需数据
    if ([ip hasPrefix:@"var returnCitySN = "]) {
        //对字符串进行处理，然后进行json解析
        //删除字符串多余字符串
        if (ip.length > 20) {
            NSRange range = NSMakeRange(0, 19);
            [ip deleteCharactersInRange:range];
            NSString * nowIp =[ip substringToIndex:ip.length-1];
            //将字符串转换成二进制进行Json解析
            NSData * data = [nowIp dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            if (dict[@"cip"]) {
                NSString *ip = dict[@"cip"];
                //                [CYXManager setUserDefaultsStringValue:ip andKey:@"CYXIP"];
                return ip;
            }
            
        }
        
    }
    return @"192.168.1.1";
}

+ (BOOL)isFirstLaunch{
    NSString *firstLaunch = [CyUserDefaults valueForKey:@"FirstLaunch"];
    if(firstLaunch){
        return NO;
    }else{
        [CyUserDefaults setValue:@"1" forKey:@"FirstLaunch"];
        return YES;
    }
}

+ (BOOL)isLogin{
    
    return NO;
}



+ (void)loginOut{
 
}

+ (void)alertControllerWithTitle:(NSString *)title
                         message:(NSString *)message
                        doTitle:(NSString *)dotitle cancelTitle:(NSString *)cancelTitle doAction:(void (^)(UIAlertAction *))doActionHandler cancelAction:(void (^)(UIAlertAction *))cancelActionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle: UIAlertControllerStyleAlert];
    if(dotitle){
        UIAlertAction *doAction = [UIAlertAction actionWithTitle:dotitle style:UIAlertActionStyleDefault handler:doActionHandler];
        [alertController addAction:doAction];
    }
    if(cancelTitle){
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelActionHandler];
        [alertController addAction:cancelAction];
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}

//获取缓存大小
+ (NSString *)getCurrentCache
{
    SDImageCache *SDCache = [SDImageCache sharedImageCache];
    NSUInteger cacheSize = SDCache.getSize;
    NSString *sizeText;
    if (cacheSize >= pow(10, 9)) { // size >= 1GB
        sizeText = [NSString stringWithFormat:@"%.2fGB", cacheSize / pow(10, 9)];
    } else if (cacheSize >= pow(10, 6)) { // 1GB > size >= 1MB
        sizeText = [NSString stringWithFormat:@"%.2fMB", cacheSize / pow(10, 6)];
    } else if (cacheSize >= pow(10, 3)) { // 1MB > size >= 1KB
        sizeText = [NSString stringWithFormat:@"%.2fKB", cacheSize / pow(10, 3)];
    } else { // 1KB > size
        sizeText = [NSString stringWithFormat:@"%zdB", cacheSize];
    }
    return sizeText;
}
//清除缓存
+ (void)clearCurrentCache
{
    [[SDImageCache sharedImageCache] clearDisk];
}

+ (void)cornerRadiusWith:(UIView *)view{
    view.clipsToBounds = YES;
    view.layer.cornerRadius = view.bounds.size.height/2;
}
+ (void)borderWith:(UIView *)view Color:(UIColor *)color{
    view.layer.borderWidth = 0.5;
    view.layer.borderColor = color.CGColor;
}

+ (void)downloadWebImageWithUrlString:(NSArray *)urlArray finish:(void(^)(NSArray *images))finish{
    NSMutableArray *array = [NSMutableArray new];
//    for(NSString *urlString in urlArray){
//        NSURL *url =[NSURL URLWithString:urlString];
//        NSData *data =[NSData dataWithContentsOfURL:url];
//        UIImage *image =[UIImage imageWithData:data];
//        [array addObject:image];
//    }
    for(NSString *urlString in urlArray){
        NSURL *url =[NSURL URLWithString:urlString];
        
        __block NSString *blockUrl = urlString;
        [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url options:SDWebImageDownloaderUseNSURLCache progress:^(NSInteger receivedSize, NSInteger expectedSize) {
            
        } completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
            if(!error){
                NSDictionary *dict = @{@"url":blockUrl,@"image":image};
                [array addObject:dict];
                if(array.count==urlArray.count && finish){
                    NSMutableArray *finishArray = [NSMutableArray new];
                    for (NSString *url_String in urlArray){
                        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"url like %@", url_String];
                        NSArray *filteredArray = [array filteredArrayUsingPredicate:predicate];
                        if(filteredArray.count){
                            NSDictionary *dic = filteredArray.firstObject;
                            [finishArray addObject:dic[@"image"]];
                        }
                    }
                    finish(finishArray);
                }
            }else{
                NSLog(@"downLoadImageError!!!");
                finish(nil);
            }
        }];
    }
}
/*
+ (void)popRootViewController{
    UINavigationController *nav;
    UIViewController *vc = GGappDelegate.topViewController;
    if([vc isKindOfClass:[UINavigationController class]]){
        nav = (UINavigationController *)vc;
    }else{
        nav = vc.navigationController;
    }
    [nav popToRootViewControllerAnimated:NO];
}
*/
@end
