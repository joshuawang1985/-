//
//  ZZYStatusFrame.h
//  爆笑姐夫
//
//  Created by MS on 15-10-9.
//  assign, readonlyright (c) 2015年 张志远. All rights reserved.
//一个cell对应一个ZZYStatus对象

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreGraphics/CoreGraphics.h>//注意怎样才能使用CGRect－－添加框架和头文件－－需要配置
#define ZZYStatusTitleFont [UIFont systemFontOfSize:15.0]

@class ZZYStatus;

@interface ZZYStatusFrame : NSObject
@property (nonatomic, strong) ZZYStatus * status;
/**
 *  标题
 */
@property (nonatomic, assign, readonly) CGRect  titleFrame;

/**
 *  顶
 */
@property (nonatomic, assign, readonly) CGRect  upNumFrame;

/**
 *  砸
 */
@property (nonatomic, assign, readonly) CGRect  downNumFrame;

/**
 *  分享
 */
@property (nonatomic, assign, readonly) CGRect  shareNumFrame;

/**
 *  评论
 */
@property (nonatomic, assign, readonly) CGRect  commentNumFrame;

/** 中间界面父控件 */
@property (nonatomic ,assign, readonly) CGRect centerViewFrame;

/**
 *  图片
 */
@property (nonatomic, assign, readonly) CGRect  mainPicPathFrame;
/**
 *  中间图片上的底部
 */
@property (nonatomic, assign, readonly) CGRect  VideoLabelFrame;
/**
 *  视频播放次数
 */
@property (nonatomic, assign, readonly) CGRect  clickNumFrame;

/**
 *  视频播放时长
 */
@property (nonatomic, assign, readonly) CGRect  playTimeFrame;
/**
 *  cell的工具条
 */
@property (nonatomic, assign, readonly) CGRect  cellStatusFrame;

/** cell的高度 */
@property (nonatomic, assign, readonly) CGFloat cellHeight;
@end
