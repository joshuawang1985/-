//
//  ZZYStatus.h
//  爆笑姐夫
//
//  Created by MS on 15-10-8.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZZYItemView.h"
@interface ZZYStatus : NSObject

/**
 *  标题
 */
@property (nonatomic, copy) NSString * title;

/**
 *  顶
 */
@property (nonatomic, copy) NSString * upNum;

/**
 *  砸
 */
@property (nonatomic, copy) NSString * downNum;

/**
 *  分享
 */
@property (nonatomic, copy) NSString * shareNum;

/**
 *  评论
 */
@property (nonatomic, copy) NSString * commentNum;

/**
 *  图片
 */
@property (nonatomic, copy) NSString * mainPicPath;
/**
 *  数据类型*(视频还是图片)
 */
@property (nonatomic, copy) NSString * mediaType;
/**
 *  视频播放次数
 */
@property (nonatomic, copy) NSString * clickNum;
/**
 *  详细数据
 */
@property (nonatomic, strong) ZZYItemView * itemView;
@end
