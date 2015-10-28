//
//  ZZYMainRootViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-7.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYMainRootViewController.h"
#import "ZZYOnwViewController.h"
#import "ZZYTwoViewController.h"
#import "ZZYThreeViewController.h"
#import "ZZYForthViewController.h"
#import "ZZYFiveViewController.h"
#import "MJExtension.h"
#import "ZZYStatus.h"
#import "ZZYItemView.h"
#import "ZZYStatusFrame.h"
#import "ZZYMainTableViewCell.h"
#import "ZZYDetailViewController.h"
@interface ZZYMainRootViewController ()
{
    UITableView * table;
}
//该数组中保存的全是frame的数据

@property (nonatomic, strong) NSArray *statusFrames;
@end

@implementation ZZYMainRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.创建表格视图
    [self createtable];

}

- (void)createtable
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
}
//实现协议中的方法
- (void)sendDataFromRequest:(NSMutableData *)data andPath:(NSString *)path
{
    //解析数据
    NSDictionary * allDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
   //获得有用的数据---字典数组
    NSArray * array = [[NSArray alloc]initWithArray:allDic[@"data"]];
  //将字典数组转化为模型数组(里面放的就是ZZYStatus模型)
    NSArray * statusArray = [ZZYStatus objectArrayWithKeyValuesArray:array];
    
    //创建frame模型对象
    NSMutableArray *statusFrameArray = [NSMutableArray array];//为什么这种方法
    for (ZZYStatus * status in statusArray) {
        ZZYStatusFrame * statusFrame = [[ZZYStatusFrame alloc]init];
        //传递ZZYStatus数据模型数据
        statusFrame.status = status;
        [statusFrameArray addObject:statusFrame];
    }
    
    //赋值
    self.statusFrames = statusFrameArray;
    //刷新表格
    [table reloadData];
    
    
//    //可变数组保存一个个的字典
//    NSMutableArray * dicArr = [[NSMutableArray alloc]init];
//     //为数据源赋值
//    for (int i = 0; i < array.count; i ++) {
//        //创建一个字典保存为一个cell的数据信息
//        NSMutableDictionary * smallDic = [[NSMutableDictionary alloc]init];
//        //标题
//        [smallDic setObject:array[i][@"title"] forKey:@"nameLabel"];
//        //顶
//        [smallDic setObject:[NSString stringWithFormat:@"%@",array[i][@"upNum"]] forKey:@"upNum"];//注意写法
//        //砸
//        [smallDic setObject:[NSString stringWithFormat:@"%@",array[i][@"downNum"]] forKey:@"downNum"];
//        //分享
//        [smallDic setObject:[NSString stringWithFormat:@"%@",array[i][@"shareNum"]] forKey:@"shareNum"];
//        //评论
//        [smallDic setObject:[NSString stringWithFormat:@"%@",array[i][@"commentNum"]] forKey:@"commentNum"];
//        //图片
//        [smallDic setObject:array[i][@"mainPicPath"] forKey:@"image"];
//        //视频、图片的高度
//        NSString * height = [NSString stringWithFormat:@"%@", array[i][@"itemView"][@"height"]];
//        [smallDic setObject:height forKey:@"height"];
//        //视频、图片的播放网址
//        NSString * url = [NSString stringWithFormat:@"%@", array[i][@"itemView"][@"gifPath"]];
//        [smallDic setObject:url forKey:@"url"];
//        //详细界面id
//        [smallDic setObject:[NSString stringWithFormat:@"%@",array[i][@"id"]] forKey:@"detail"];
//        
//        //以上部分是图片和视频共有的
//        //区分数据是图片还是视频--通过itemView中的mediaType区分－－1是图片，2是视频
//        NSString * mediaType = [NSString stringWithFormat:@"%@", array[i][@"itemView"][@"mediaType"]];
//        //数据类型
//        [smallDic setObject:mediaType forKey:@"mediaType"];
//        //以下是视频独有的数据
//        if([mediaType isEqualToString:@"2"])
//        {
//            //播放次数
//            [smallDic setObject:[NSString stringWithFormat:@"%@",array[i][@"clickNum"]] forKey:@"clickNum"];
//            //视频时长----怎么写－－和视频下部的进度条有关系
//            [smallDic setObject:[NSString stringWithFormat:@"%@",array[i][@"itemView"][@"playTime"]] forKey:@"playTime"];
//            
//        }
//            
//        
//        [dicArr addObject:smallDic];
//    }
//    NSLog(@"%@",dicArr);
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusFrames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    ZZYMainTableViewCell * cell = [ZZYMainTableViewCell cellWithTableView:tableView];
    
    //2.settingFrame
    cell.statusFrame = self.statusFrames[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZYStatusFrame * statusFrame = self.statusFrames[indexPath.row];//此处注意
    
    return statusFrame.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZYDetailViewController * deatilView = [[ZZYDetailViewController alloc]init];
    NSLog(@"%p",deatilView);
//为什么这个方法不能够跳转
    [self.navigationController pushViewController:deatilView animated:YES];
    NSLog(@"111");
    
//    [self presentViewController:deatilView animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
