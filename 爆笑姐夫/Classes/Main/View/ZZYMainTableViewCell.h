//
//  ZZYMainTableViewCell.h
//  爆笑姐夫
//
//  Created by MS on 15-10-8.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZZYStatusFrame;//注意此处不要忽略

@interface ZZYMainTableViewCell : UITableViewCell
@property (nonatomic, strong) ZZYStatusFrame * statusFrame;
/**
 *  通过一个tableView来创建一个cell，并赋值
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
