//
//  ZZYOnwViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-7.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYOnwViewController.h"
#import "RequestData.h"
#import "Header.h"
@interface ZZYOnwViewController ()

@end

@implementation ZZYOnwViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //请求数据
    RequestData * request = [[RequestData alloc]init];
    currentPage = 0;//注意不要忽略-－同时注意首页为0
    request.path = [NSString stringWithFormat:CHOSEPATH,currentPage];
    request.delegate = self;//设置代理调用协议中的方法
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
