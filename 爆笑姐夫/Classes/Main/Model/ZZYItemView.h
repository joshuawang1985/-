//
//  ZZYItemView.h
//  爆笑姐夫
//
//  Created by MS on 15-10-8.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZYItemView : NSObject

/**
 *  视频、图片播放地址
 */
@property (nonatomic, copy) NSString * gifPath;
//注意使用第三方库字典转模型时，一定要让声明的变量名与数据解析出来的key值相同
//@property (nonatomic, copy) NSString * playUrl;

/**
 *  图片的高度
 */
@property (nonatomic, copy) NSString * height;
/**
 *  视频、图片ID
 */
@property (nonatomic, copy) NSString * articleId;
/**
 *  视频播放时长
 */
@property (nonatomic, copy) NSString * playTime;
@end
