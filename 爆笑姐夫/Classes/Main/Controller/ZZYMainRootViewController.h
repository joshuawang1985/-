//
//  ZZYMainRootViewController.h
//  爆笑姐夫
//
//  Created by MS on 15-10-7.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestData.h"
@interface ZZYMainRootViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,sendDataToCtr>
{
    //下拉刷新
    BOOL isRefreshing;
    //上拉加载
    BOOL isLoading;
    
    //当前页数
    int currentPage;
    
}

//刷新加载视图
- (void)refreshAndLoading:(NSString *)path;
@end
