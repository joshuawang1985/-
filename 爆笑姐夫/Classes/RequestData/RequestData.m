//
//  RequestData.m
//  爆笑姐夫
//
//  Created by MS on 15-10-6.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "RequestData.h"

@implementation RequestData
/**
 *  请求数据
 */
-(void)startRequestData
{
    //1.获取请求数据的路径
    NSString * pathStr = self.path;
    //2.转化成NSURL
    NSURL * url = [NSURL URLWithString:pathStr];
    //3.封装成请求对象
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    //4.开始异步请求
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark -- NSURLConnectionDelegete
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    if (myData == nil) {
        myData = [[NSMutableData alloc]init];
    }
    else
    {
        myData.length = 0;//注意这种清空方式
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [myData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if ([self.delegate respondsToSelector:@selector(sendDataFromRequest:andPath:)]) {
        [self.delegate sendDataFromRequest:myData andPath:self.path];
    }
    else
    {
        NSLog(@"被动方没有实现协议的方法");
    }
}
@end
