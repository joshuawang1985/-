//
//  ZZYMainViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-9-30.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYMainViewController.h"
#import "ZZYOnwViewController.h"
#import "ZZYTwoViewController.h"
#import "ZZYThreeViewController.h"
#import "ZZYForthViewController.h"
#import "ZZYFiveViewController.h"
//以上控制器继承于root，各个控制器分别请求数据，root中进行界面的设计
#import "CAPSPageMenu.h"
@interface ZZYMainViewController ()<CAPSPageMenuDelegate>
@property (nonatomic) CAPSPageMenu *pageMenu;
@end

@implementation ZZYMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationItem.title = @"爆笑姐夫";//程序首页标题不相同，在这里进行修改
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];

    //创建各个视图控制器
    [self createViewCtrs];
    
}
/**
 *  创建各个视图控制器
 *
 */
- (void)createViewCtrs
{
    ZZYOnwViewController * oneVc = [[ZZYOnwViewController alloc]init];
    oneVc.title = @"精选";
    ZZYTwoViewController * twoVc =[[ZZYTwoViewController alloc]init];
    twoVc.title = @"图片";
    ZZYThreeViewController * threeVc = [[ZZYThreeViewController alloc]init];
    threeVc.title = @"视频";
ZZYForthViewController * fourVc = [[ZZYForthViewController alloc]
                                   init];
    fourVc.title = @"最新";
    
    ZZYFiveViewController * fiveVc = [[ZZYFiveViewController alloc]init];
    fiveVc.title = @"最热";
    
    NSArray * array = @[oneVc,twoVc,threeVc,fourVc,fiveVc];
    
        /*
     CAPSPageMenuOptionScrollMenuBackgroundColor : menu（条）背景颜色
     CAPSPageMenuOptionViewBackgroundColor  : CAPSpagemenu 的view背景颜色
     CAPSPageMenuOptionSelectionIndicatorColor : 标识条的颜色
     CAPSPageMenuOptionBottomMenuHairlineColor : 标示条下的线颜色
     CAPSPageMenuOptionMenuItemFont : 每个item的字体
     CAPSPageMenuOptionMenuHeight : menu（条）高度
     CAPSPageMenuOptionMenuItemWidth : menu（条）宽度
     */
    NSDictionary *parameters = @{
                                 CAPSPageMenuOptionScrollMenuBackgroundColor:[UIColor colorWithRed:61.0/255.0 green:103.0/255.0 blue:192.0/255.0 alpha:1.0],//背景颜色
                                 //                                 CAPSPageMenuOptionViewBackgroundColor:[UIColor colorWithRed:20.0/255.0 green:20.0/255.0 blue:20.0/255.0 alpha:1.0],
                                 CAPSPageMenuOptionViewBackgroundColor:[UIColor redColor],CAPSPageMenuOptionSelectionIndicatorColor: [UIColor orangeColor],// 下面指示条的颜色
                                 CAPSPageMenuOptionBottomMenuHairlineColor: [UIColor whiteColor],
                                 CAPSPageMenuOptionMenuItemFont: [UIFont fontWithName:@"HelveticaNeue" size:18.0],
                                 CAPSPageMenuOptionMenuHeight: @(40.0),
                                 CAPSPageMenuOptionMenuItemWidth: @(50.0),
                                 CAPSPageMenuOptionCenterMenuItems: @(YES)
                                 };
    
    //参数一: 视图控制器组成的数组
    //参数二: frame
    //参数三: options 参数字典
    self.pageMenu = [[CAPSPageMenu alloc]initWithViewControllers:array frame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) options:parameters];
    [self.view addSubview:self.pageMenu.view];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
