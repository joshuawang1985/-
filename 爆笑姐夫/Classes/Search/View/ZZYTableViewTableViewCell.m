//
//  ZZYTableViewTableViewCell.m
//  爆笑姐夫
//
//  Created by MS on 15-10-7.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYTableViewTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface ZZYTableViewTableViewCell()
@property (strong, nonatomic) IBOutlet UIImageView *iconView;
@property (strong, nonatomic) IBOutlet UILabel *nameView;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;
@property (strong, nonatomic) IBOutlet UILabel *hotLabel;



@end

@implementation ZZYTableViewTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath andDataArray1:(NSMutableArray *)array1 DataArray2:(NSMutableArray *)array2
{
    static NSString * str = @"iden";
    //static 修饰的局部变量：可以保证局部变量只分配一次存储空间（只初始化一次）
    //1.通过一个标识去缓存池里寻找可以重复利用的cell
    ZZYTableViewTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    //2. 如果没有cell
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"ZZYTableViewTableViewCell" owner:self options:nil]lastObject];
    }
    
    //3.给cell赋值
    if (indexPath.section == 0) {
        
        [cell.iconView sd_setImageWithURL:[NSURL URLWithString:array1[indexPath.row][@"image"]]];
        cell.nameView.text = array1[indexPath.row][@"name"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.numLabel.hidden = YES;
        cell.hotLabel.hidden = YES;
        cell.iconView.hidden = NO;
        cell.nameView.hidden = NO;
    }
    else
    {
        //这种设置在cell中一定要成对出现  yes---no
        cell.hotLabel.hidden = NO;
        cell.numLabel.hidden = NO;//这种设置在cell中一定要成对出现
        cell.imageView.hidden = YES;
        cell.nameView.hidden = YES;
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.hotLabel.text = array2[indexPath.row][@"name"];
        cell.numLabel.text = array2[indexPath.row][@"number"];
        cell.numLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return cell;
}
@end
