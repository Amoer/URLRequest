//
//  NSMutableURLRequest+Custom.h
//  Post上传文件
//
//  Created by ziboow on 15/12/26.
//  Copyright (c) 2015年 ziboow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSMutableURLRequest (Custom)
/**
 *  通过文件名称上传
 */
+ (instancetype) requestWithURL:(NSURL *)URL andShowFileName:(NSString *)showFileName andUploadFileName:(NSString *)uploadFileName;
/**
 *  通过 image 上传
 */
+ (instancetype) requestWithURL:(NSURL *)URL andShowFileName:(NSString *)showFileName andUploadImage:(UIImage *)image;

//+ (instancetype) requestWithURL:(NSURL *)URL andShowFileName:(NSString *)showFileName;

@end
