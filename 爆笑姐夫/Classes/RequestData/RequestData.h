//
//  RequestData.h
//  爆笑姐夫
//
//  Created by MS on 15-10-6.
//  Copyright (c) 2015年 张志远. All rights reserved.
//
//通过代理将请求下来的数据传递到各个对应的控制器
#import <Foundation/Foundation.h>
//请求数据的所有操作在一个类中完成
//该类进行数据请求，请求下来的数据要显示在不同视图控制器的视图上

@protocol sendDataToCtr <NSObject>

@optional
- (void)sendDataFromRequest:(NSMutableData *)data andPath:(NSString *)path;
//由于一个界面上请求数据的接口，可能不止一个。为了区分请求数据属于哪个接口，所以我们传递接口信息作为区分
@end

@interface RequestData : NSObject<NSURLConnectionDataDelegate>
//只要没有文件上传就是GET
{
    NSMutableData * myData;
}

@property (nonatomic, retain) NSString * path;//请求数据的接口
//主动方 要求视图控制器的视图显示数据   谁显示数据谁就是被动方
@property (nonatomic, strong) id <sendDataToCtr>delegate;

- (void)startRequestData;//请求数据
@end
