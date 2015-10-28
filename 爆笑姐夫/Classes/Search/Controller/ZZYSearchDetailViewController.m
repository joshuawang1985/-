//
//  ZZYSearchDetailViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-9.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYSearchDetailViewController.h"

@interface ZZYSearchDetailViewController ()

@end

@implementation ZZYSearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置返回按钮的样式
    UIBarButtonItem * backBarButton = [[UIBarButtonItem alloc]init];
    [backBarButton setTitle:@"返回"];
    self.navigationItem.backBarButtonItem = backBarButton;
    
    
    //请求数据
    RequestData * request = [[RequestData alloc]init];
    request.delegate = self;
    currentPage = 0;
    request.path = [NSString stringWithFormat:self.path,currentPage];
    NSLog(@"%@",request.path);
    [request startRequestData];
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
