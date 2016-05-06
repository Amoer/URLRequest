//
//  NSMutableURLRequest+Custom.m
//  Post上传文件
//
//  Created by ziboow on 15/12/26.
//  Copyright (c) 2015年 ziboow. All rights reserved.
//

#import "NSMutableURLRequest+Custom.h"

static NSString * boundary = @"boundary";

@implementation NSMutableURLRequest (Custom)

/**
 *  通过图片名字上传
 *
 *  @param URL            图片上传 URL
 *  @param showFileName   在服务器上存放图片的名称
 *  @param uploadFileName 要上传的图片名称
 *
 *  @return 可变的request
 */
//+ (instancetype) requestWithURL:(NSURL *)URL andShowFileName:(NSString *)showFileName andUploadFileName:(NSString *)uploadFileName{
//    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:URL cachePolicy:1 timeoutInterval:10.0];
//    request.HTTPMethod = @"post";
//    NSMutableData *uploadData = [NSMutableData data];
//    
//    NSString *uploadDataString = [NSString stringWithFormat:@"\r\n--%@\r\n",boundary];
//    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    uploadDataString = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\" \r\n",showFileName];
//    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    uploadDataString = @"Content-Type: application/octet-stream\r\n\r\n";
//    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    NSString *uploadPath = [[NSBundle mainBundle] pathForResource:uploadFileName ofType:nil];
//    [uploadData appendData:[NSData dataWithContentsOfFile:uploadPath]];
//    
//    uploadDataString = [NSString stringWithFormat:@"\r\n--%@\r\n",boundary];
//    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    request.HTTPBody = uploadData; // 设置请求体
//    
//    uploadDataString = [NSString stringWithFormat:@"multipart/form-data;boundary=%@",boundary];
//    [request setValue:uploadDataString forHTTPHeaderField:@"Content-Type"]; //设置请求头部
//    
//    return request;
//}

/**
 *  通过图片 image 上传
 *
 *  @param URL            图片上传URL
 *  @param showFileName   在服务器上存放图片的名称
 *  @param uploadFileName 要上传的图片的 image
 *  @return 可变的 request
 */
+ (instancetype) requestWithURL:(NSURL *)URL andShowFileName:(NSString *)showFileName andUploadImage:(UIImage *)image {
    NSMutableURLRequest * request = [NSMutableURLRequest requestWithURL:URL cachePolicy:1 timeoutInterval:2.0];
    
    request.HTTPMethod = @"post";
    NSMutableData *uploadData = [NSMutableData data];
    
    NSString *uploadDataString = [NSString stringWithFormat:@"--%@\r\n",boundary];
    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    uploadDataString = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"token\"\r\n\r\n"];
    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    uploadDataString = [NSString stringWithFormat:@"%@\r\n",@"72dd63c8ea32c633e12085513abbdeb3"];
    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    uploadDataString = [NSString stringWithFormat:@"--%@\r\n",boundary];
    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    uploadDataString = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"img\"; filename=\"%@\" \r\n",showFileName];
    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    uploadDataString = @"Content-Type: application/octet-stream\r\n\r\n";
    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    [uploadData appendData:imageData];
    
    uploadDataString = [NSString stringWithFormat:@"\r\n--%@--\r\n",boundary];
    [uploadData appendData:[uploadDataString dataUsingEncoding:NSUTF8StringEncoding]];
    // 设置请求体
    request.HTTPBody = uploadData;
    
    uploadDataString = [NSString stringWithFormat:@"multipart/form-data;boundary=%@",boundary];
    //设置请求头部
    [request setValue:uploadDataString forHTTPHeaderField:@"Content-Type"];

    return request;
}


@end
