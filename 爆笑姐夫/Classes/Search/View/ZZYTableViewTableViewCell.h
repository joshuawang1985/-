//
//  ZZYTableViewTableViewCell.h
//  爆笑姐夫
//
//  Created by MS on 15-10-7.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZZYTableViewTableViewCell : UITableViewCell
/**
 *  通过一个tableView来创建一个cell，并赋值
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath andDataArray1:(NSMutableArray *)array1 DataArray2:(NSMutableArray *)array2;
@end
