//
//  ZZYStatusFrame.m
//  爆笑姐夫
//
//  Created by MS on 15-10-9.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYStatusFrame.h"
#import "ZZYStatus.h"
#import "ZZYItemView.h"



/** cell的边框宽度 */
#define ZZYStatusCellBorder 5

@implementation ZZYStatusFrame
/**
 *  获得模型数据之后, 根据数据计算所有子控件的frame
 */
-(void)setStatus:(ZZYStatus *)status
{
    _status = status;
    
    //cell的宽度------点不出来时注意配置环境－－库－头文件
    CGFloat cellW = [UIScreen mainScreen].bounds.size.width;
    
    //1.标题title
    CGFloat titleW = cellW - 2 * ZZYStatusCellBorder;
    CGFloat titleX = ZZYStatusCellBorder;
    CGFloat titleY = ZZYStatusCellBorder;
//    [status.title sizeWithFont:ZZYStatusTitleFont];//过时的方法
    
    //根据文字判断label的大小   其中三个数据: 需要计算尺寸的文字 文字的最大尺寸 文字的字体
 CGSize titieSize = [status.title boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : ZZYStatusTitleFont} context:nil].size;
    //注意此处声明时使用的是readonly，不能用set方法、不能self的点语法
    _titleFrame = CGRectMake(titleX, titleY, titleW, titieSize.height + ZZYStatusCellBorder);
    
    //2.图片
    CGFloat imageXY = 0;
    CGFloat imageW = titleW;
    CGFloat imageH = [_status.itemView.height intValue];
    _mainPicPathFrame = CGRectMake(imageXY, imageXY, imageW, imageH);
    
    //3.中间界面父控件
    CGFloat centerViewX = ZZYStatusCellBorder;
    CGFloat centerViewY = CGRectGetMaxY(_titleFrame);
    CGFloat centerViewW = titleW;
    CGFloat centerViewH = CGRectGetHeight(_mainPicPathFrame);
    _centerViewFrame = CGRectMake(centerViewX, centerViewY, centerViewW, centerViewH);
    
    
    //4.中间图片上得View
    CGFloat videoLabelX = 0;
    CGFloat videoLabelY = CGRectGetMaxY(_mainPicPathFrame) - 30;
    CGFloat videoLabelW = imageW;
    CGFloat videoLabelH = 30;
    _VideoLabelFrame = CGRectMake(videoLabelX, videoLabelY, videoLabelW, videoLabelH);
    //5.视频播放次数----如何设置
//    CGFloat videoClickNumX = 0;
//    CGFloat videoClickNumY = 0;
//   CGSize videoClickNumSize = [self.status.clickNum boundingRectWithSize:CGSizeMake(MAXFLOAT, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:ZZYStatusTitleFont} context:nil].size;
//    _centerViewFrame = CGRectMake(videoClickNumX, videoClickNumY, videoClickNumSize.width, videoClickNumSize.height);
    
    //6.cell的工具条
    CGFloat cellStatusX = ZZYStatusCellBorder;
    //注意此处使用的是_centerViewFrame，不要使用_mainPicPathFrame，要使用父控件(两个的父控件不同)
    CGFloat cellStatusY = CGRectGetMaxY(_centerViewFrame) + ZZYStatusCellBorder;
    CGFloat cellStatusW = titleW;
    CGFloat cellStatusH = 65;
    _cellStatusFrame = CGRectMake(cellStatusX, cellStatusY, cellStatusW, cellStatusH);
    
    
    
    //cell的高度
    _cellHeight = CGRectGetMaxY(_cellStatusFrame);
    
    
}

@end
