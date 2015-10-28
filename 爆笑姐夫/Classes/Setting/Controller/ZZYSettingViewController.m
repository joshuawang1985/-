//
//  ZZYSettingViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-6.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYSettingViewController.h"
#import "ZZYSettingTableViewCell.h"
#import "AboutDetailViewController.h"
#import "ProposeViewController.h"
@interface ZZYSettingViewController ()
{
    NSMutableArray * dataArray;
    UITableView * table;
    UIButton * button1;
    UIButton * button2;

}

@end

@implementation ZZYSettingViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //设置显示tabBar---单机cell时在下一个视图中设置了隐藏，如果此处不设置返回时tabBar会消失------注意要写在这个方法里面，写在viewDidLoad中无效－－－？？？为什么
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
       //设置导航条文字的颜色
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
   
    
    //设置返回按钮的样式－－－注意在push前的页面进行书写
    UIBarButtonItem * backBarButton = [[UIBarButtonItem alloc]init];
    [backBarButton setTitle:@"返回"];
    [backBarButton setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal
     ];
    self.navigationItem.backBarButtonItem = backBarButton;
    //设置返回按钮前面的箭头的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];


    //创建数据源
    [self createData];
    
    //创建table
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    self.tableView = table;
    
    //创建cell后面的按钮
//   [self createButton];
}
/**
 *  创建数据源
 *
 */
- (void)createData
{
    if(dataArray == nil)
    {
        dataArray = [[NSMutableArray alloc]init];
    }
    
    NSArray * arr1 = @[@"弹幕"];
    NSArray * arr2 = @[@"Wi-Fi下自动加载GIF",@"清除缓存",@"2.0.3"];
    NSArray * arr3 = @[@"关于爆笑姐夫",@"给个好评吧",@"意见或建议"];
    [dataArray addObject:arr1];
    [dataArray addObject:arr2];
    [dataArray addObject:arr3];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

        return dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

        return [dataArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  //创建cell
    ZZYSettingTableViewCell * cell = [ZZYSettingTableViewCell cellWithTableView:tableView cellForRowAtIndexPath:indexPath andDataArray:dataArray];
    
        return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //关于爆笑姐夫
    if (indexPath.section == 2 && indexPath.row == 0) {
        AboutDetailViewController * about = [[AboutDetailViewController alloc]init];
        [self.navigationController pushViewController:about animated:YES];
    }
    
    //意见或建议
    if (indexPath.section == 2 && indexPath.row == 2) {
        ProposeViewController * propose = [[ProposeViewController alloc]init];
        [self.navigationController pushViewController:propose animated:YES];
    }
    
}


@end
