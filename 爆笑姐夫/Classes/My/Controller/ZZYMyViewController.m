
//
//  ZZYMyViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-9-30.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYMyViewController.h"
#import "ZZYRegisterViewController.h"
@interface ZZYMyViewController ()
//开始不能脱线的原因－－－没有进行关联－－关联位置错了－－应该在File owner 的class进行关联
@property (nonatomic, weak) UIButton * sinaButton;
@property (nonatomic, weak) UIButton * weiChatButton;
@property (nonatomic, weak) UIButton * qqButton;
@property (nonatomic, weak) UIButton * bxGifButton;

@end

@implementation ZZYMyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    //设置返回按钮的文字
    UIBarButtonItem * backButton = [[UIBarButtonItem alloc]init];
    [backButton setTitle:@"注册/登录"];
    [backButton setTitleTextAttributes:@{NSAttachmentAttributeName : [UIColor whiteColor]} forState:UIControlStateNormal];
    self.navigationItem.backBarButtonItem = backButton;
    
    //设置返回按钮前面的箭头的颜色
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    /** 创建界面 */
    [self createUI];
}
/** 创建界面 */
- (void)createUI
{
    UIView * view = [[[NSBundle mainBundle]loadNibNamed:@"ZZYMyViewControllerView" owner:nil options:nil]lastObject];
    self.sinaButton = (UIButton *)[view viewWithTag:31];
    [self.sinaButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchDown];
    
    self.weiChatButton = (UIButton *)[view viewWithTag:32];
    [self.weiChatButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchDown];
    
    self.qqButton = (UIButton *)[view viewWithTag:33];
    [self.qqButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchDown];
    
    self.bxGifButton = (UIButton *)[view viewWithTag:34];
    [self.bxGifButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchDown];
    
 
    [self.view addSubview:view];
}

- (void)pressButton:(UIButton *)button
{
    //要向使按钮点击的时候没有一闪的效果－－－－按钮的普通和高亮(此处要注意)状态的图片使用一张
    
    switch (button.tag) {
        case 31:
            //新浪
            break;
        case 32:
            //微信
            break;
        case 33:
            //qq
            break;
        case 34:
            //姐夫
           
            break;
        default:
            break;
    }
    
    if (button.tag == 34) {
        //为什么在switch中不可以
         ZZYRegisterViewController * registerView = [[ZZYRegisterViewController alloc]init];
        [self.navigationController pushViewController:registerView animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
