//
//  AboutDetailViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-6.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "AboutDetailViewController.h"

@interface AboutDetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *icon;
@property (strong, nonatomic) IBOutlet UILabel *textLabel;

@end

@implementation AboutDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
    //设置返回文字和颜色---?
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.icon.layer.masksToBounds = 2;
    //设置圆角
    self.icon.layer.cornerRadius = 8;
    self.textLabel.textAlignment = UIControlContentVerticalAlignmentTop;//???
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
