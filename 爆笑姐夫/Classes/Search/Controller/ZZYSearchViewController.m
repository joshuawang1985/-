//
//  ZZYSearchViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-9-30.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYSearchViewController.h"
#import "RequestData.h"
#import "Header.h"
#import "ZZYTableViewTableViewCell.h"
#import "ZZYSearchDetailViewController.h"
@interface ZZYSearchViewController ()<sendDataToCtr,UITableViewDataSource,UITableViewDelegate>
{
    UITableView * table;
    //定义两个数据源分别接收两个接口解析下来的数据－－－－如果用一个数据源两个接口数据的先后顺序无法确定
    NSMutableArray * dataSource1;
    NSMutableArray * dataSource2;
    
    
}
@end

@implementation ZZYSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置返回按钮的样式－－－注意在push前的页面进行书写
    UIBarButtonItem * backBarButton = [[UIBarButtonItem alloc]init];
    [backBarButton setTitle:@"返回"];
    [backBarButton setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal
     ];
    self.navigationItem.backBarButtonItem = backBarButton;
    //设置返回按钮前面的箭头的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

    
    //关闭自动布局－－－不要忽略
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    //初始化数据源
    dataSource1 = [[NSMutableArray alloc]init];
    dataSource2 = [[NSMutableArray alloc]init];
    
    //创建table
    [self createTable];
    
    //请求数据
    [self requestInfo];
}
//创建table
- (void)createTable
{
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    //创建表格头部控件
    [self createTableHeadView];
}

- (void)createTableHeadView
{
    UISearchBar * searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    searchBar.placeholder = @"输入关键字进行搜索";
    table.tableHeaderView = searchBar;
}
//请求数据
- (void)requestInfo
{
    //获取热门分类接口的数据
    RequestData * data1 = [[RequestData alloc]init];
     data1.path = CLASSESPATH;
     data1.delegate = self;
    [data1 startRequestData];
    
    //获取热门关键字接口的数据
    RequestData * data2 = [[RequestData alloc]init];
    data2.path = HOTKEYPATH;
    data2.delegate = self;
    [data2 startRequestData];
}

//实现协议的方法
- (void)sendDataFromRequest:(NSMutableData *)data andPath:(NSString *)path
{
    
    NSDictionary * allDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    if ([path isEqualToString:CLASSESPATH])
    {
        
        //取出解析数据中有用的数据
        NSMutableArray * array = [[NSMutableArray alloc]init];
        [array addObjectsFromArray:allDic[@"data"]];
        
      
       NSMutableArray * arrayCell1 = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < array.count; i ++)
        {
            NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
            [dic setValue:array[i][@"name"] forKey:@"name"];
            [dic setValue:array[i][@"img"] forKey:@"image"];
            [dic setValue:array[i][@"id"] forKey:@"typeId"];
            [arrayCell1 addObject:dic];

        }
        [dataSource1 addObjectsFromArray:arrayCell1];
        [table reloadData];
    }
    else
    {
        //取出解析数据中有用的数据
        NSMutableArray * array = [[NSMutableArray alloc]init];
        [array addObjectsFromArray:allDic[@"data"]];
        
        
        NSMutableArray * arrayCell2 = [[NSMutableArray alloc]init];
        
        for (int i = 0; i < array.count; i ++)
        {
            NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
            [dic setValue:array[i][@"name"] forKey:@"name"];
            [dic setValue:[NSString stringWithFormat:@"%@",array[i][@"articleCount"]] forKey:@"number"];
            [dic setValue:array[i][@"id"] forKey:@"typeId"];
           [arrayCell2 addObject:dic];
            
        }
        [dataSource2 addObjectsFromArray:arrayCell2];
        [table reloadData];
    }
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
   return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return dataSource1.count;
    }
    else
    {
        return dataSource2.count;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    ZZYTableViewTableViewCell * cell = [ZZYTableViewTableViewCell cellWithTableView:tableView cellForRowAtIndexPath:indexPath andDataArray1:dataSource1 DataArray2:dataSource2];
    
    return cell;
    
}
//设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
//设置段首高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}
//设置段尾高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
}
//自定义段首
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,44)];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor lightGrayColor];
    if (section == 0) {
        label.text = @"热门分类";
    }
    else
    {
        label.text = @"热门关键字";
    }
    return label;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZZYSearchDetailViewController * searchDetail = [[ZZYSearchDetailViewController alloc]init];
    if (indexPath.section == 0) {
        NSString * typeId = dataSource1[indexPath.row][@"typeId"];
        NSLog(@"%d",typeId);
        searchDetail.path = [NSString stringWithFormat:CLASSESDETAIL,typeId];//这样写会有警告
    }
    else
    {
        NSString * typeId = dataSource1[indexPath.row][@"typeId"];
       
        searchDetail.path = [NSString stringWithFormat:HOTKEYDETAIL,typeId];
    }

    [self.navigationController pushViewController:searchDetail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
