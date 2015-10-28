//
//  MyTabBar.h
//  爆笑姐夫
//
//  Created by MS on 15-10-5.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import <UIKit/UIKit.h>
//想要将自定义tabBar按钮的点击传递给controller，使用代理进行传递
@class MyTabBar;//注意分号
@protocol ZZYTabBarDelegate <NSObject>

@optional
- (void)tabBar:(MyTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to;

@end

@interface MyTabBar : UIView

- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

@property (nonatomic, weak) id <ZZYTabBarDelegate>delegate;

@end
