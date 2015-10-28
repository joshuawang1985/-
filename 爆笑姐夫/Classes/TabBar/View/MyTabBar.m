//
//  MyTabBar.m
//  爆笑姐夫
//
//  Created by MS on 15-10-5.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "MyTabBar.h"
#import "MyTabBarButton.h"

@interface MyTabBar()
@property (nonatomic, strong) NSMutableArray * tabBarButtons;

@property (nonatomic , weak) MyTabBarButton * selectedButton;
@end

@implementation MyTabBar

- (NSMutableArray *)tabBarButtons
{
    if (_tabBarButtons == nil) {
        _tabBarButtons = [[NSMutableArray alloc]init];
    }
    return _tabBarButtons;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    return self;
}

-(void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    //<1>创建按钮
    MyTabBarButton * button = [[MyTabBarButton alloc]init];
    [self addSubview:button];
    //添加按钮到数组
    [self.tabBarButtons addObject:button];
    
    //2.设置数据
    button.item = item;
    
    //3.监听按钮的点击
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    //4.默认选中第0个按钮

   if (self.tabBarButtons.count == 1) {
        [self buttonClick:button];
    }
}
/**
 *  监听按钮点击
 */
- (void)buttonClick:(MyTabBarButton *)button
{
    //1.通知代理----注意要写在前面
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectedButtonFrom:to:)]) {
        [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    //2.设置按钮的状态
    self.selectedButton.selected = NO;
    button.selected = YES;//开始点击没有选中图像出现的原因是因为在点击事件里面没有设置选中状态
    self.selectedButton = button;
}

- (void)layoutSubviews//－－－－没有设置frame，
{
    [super layoutSubviews];
    //按钮的frame数据
    CGFloat buttonH = self.frame.size.height;
    CGFloat buttonW = self.frame.size.width / self.subviews.count;
    CGFloat buttonY = 0;
    for (int index = 0; index < self.subviews.count; index ++) {
        //1.取出按钮
        MyTabBarButton * button = self.tabBarButtons[index];
        //2.设置按钮的frame
        CGFloat buttonX = index * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        //3. 绑定tag值
        button.tag = index;
        
    }
}

@end
