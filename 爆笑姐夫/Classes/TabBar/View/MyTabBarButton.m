//
//  MyTabBarButton.m
//  爆笑姐夫
//
//  Created by MS on 15-10-5.
//  Copyright (c) 2015年 张志远. All rights reserved.
//
// 图标的比例
#define ZZYTabBarButtonImageRatio 0.6
//文字颜色
#define TEXTCOLOR  [UIColor colorWithRed:175/255.0 green:175/255.0 blue:175/255.0 alpha:1.0]

#import "MyTabBarButton.h"

@implementation MyTabBarButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //图标居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //文字颜色
        [self setTitleColor:TEXTCOLOR forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        //文字字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:11];
    }
    
    return self;
}
//重写去掉高亮状态-----高亮状态，长按时会变灰
- (void)setHighlighted:(BOOL)highlighted{}

//内部图片的frame
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;//???
    CGFloat imageH = contentRect.size.height * ZZYTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
    
}

//内部文字的frame
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = contentRect.size.height * ZZYTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
//设置item
- (void)setItem:(UITabBarItem *)item
{
    _item = item;
    
    //KVO 监听属性改变 --- 为什么这么写
    [item addObserver:self forKeyPath:@"title" options:0 context:nil];
    [item addObserver:self forKeyPath:@"image" options:0 context:nil];
    [item addObserver:self forKeyPath:@"selectedImage" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
}

- (void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"title"];
    [self.item removeObserver:self forKeyPath:@"image"];
    [self.item removeObserver:self forKeyPath:@"selectedImage"];
}



- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    [self setTitle:self.item.title forState:UIControlStateSelected];
    
    //设置图片
    [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    [self setImage:self.item.image forState:UIControlStateNormal];
    //注意在按钮的点击事件里面设置点击按钮的选中状态，否则选中没有效果
}

@end
