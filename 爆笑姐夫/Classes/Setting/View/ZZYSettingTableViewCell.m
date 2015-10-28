//
//  ZZYSettingTableViewCell.m
//  爆笑姐夫
//
//  Created by MS on 15-10-6.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYSettingTableViewCell.h"

@implementation ZZYSettingTableViewCell


- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

+(instancetype)cellWithTableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath andDataArray:(NSMutableArray *)array
{
    static NSString * str = @"str";
    //static 修饰的局部变量：可以保证局部变量只分配一次存储空间（只初始化一次）
    //1.通过一个标识去缓存池里寻找可以重复利用的cell
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
     // 2.如果没有可循环利用的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:str];
        //四种样式注意区分
    }
    //3.给cell设置数据
    cell.textLabel.text = array[indexPath.section][indexPath.row];
    
    if (indexPath.section == 0) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];//注意button的图片显示要用custom
        btn.frame = CGRectMake(0, 0, 50, 44);
        [btn setImage:[UIImage imageNamed:@"kai.png"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"guan.png"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        btn.tag = 11;
        cell.accessoryView = btn;
        
    }
    if(indexPath.section == 1 && indexPath.row == 0)
    {
        UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];//注意button的图片显示要用custom
        btn2.frame = CGRectMake(0, 0, 50, 44);
        [btn2 setImage:[UIImage imageNamed:@"kai.png"] forState:UIControlStateSelected];
        [btn2 setImage:[UIImage imageNamed:@"guan.png"] forState:UIControlStateNormal];
        [btn2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
        btn2.tag = 12;
       
        cell.accessoryView = btn2;
    }
    
    if (indexPath.section == 1 && indexPath.row != 0) {
        if (indexPath.row == 1) {
            cell.detailTextLabel.text = @"0M";
        }
        else
        {
            cell.detailTextLabel.text = @"更新版本";
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    }
    
    if(indexPath.section == 2)
    {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return (ZZYSettingTableViewCell *)cell;//直接return cell 会有警告
}

+ (void)buttonClick:(UIButton *)button
{
    //记录按钮的点击
    static int num1 = 0;
    static int num2 = 0;
    if (button.tag == 11) {
        num1 ++;
        if (num1 % 2 == 0) {
             button.selected = NO;
        }
        else {
             button.selected = YES;
        }
        
    }
    else
    {
        num2 ++;
        if (num2 % 2 == 1) {
                    button.selected = NO;
        }
        else {
                button.selected = YES;
        }
    }
}
@end
