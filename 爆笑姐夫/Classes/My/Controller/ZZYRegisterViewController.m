//
//  ZZYRegisterViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-10.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYRegisterViewController.h"

@interface ZZYRegisterViewController ()

@property (nonatomic, weak) UITextField * mobileNumTF;
@property (nonatomic, weak) UITextField * passWordTF;
@property (nonatomic, weak) UIButton * registerButton;
@property (nonatomic, weak) UIButton * loadButton;




@end

@implementation ZZYRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    
    
}

- (void)createUI
{
    // 为什么创建xib  使用view创建就报错   为什么不能脱险
    UIView * view = [[[NSBundle mainBundle]loadNibNamed:@"ZZYRegisterView1" owner:nil options:nil]lastObject];
    self.mobileNumTF = (UITextField *)[view viewWithTag:35];
    self.passWordTF = (UITextField *)[view viewWithTag:36];
    self.registerButton = (UIButton *)[view viewWithTag:37];
    [self.registerButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchDown];
    self.loadButton = (UIButton *)[view viewWithTag:38];
     [self.loadButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:view];
    
}

- (void)pressButton:(UIButton *)button
{
    NSLog(@"%@",self.mobileNumTF.text);
    if (button.tag == 37) {
        //获得验证码
        NSLog(@"reg");
        
    }else{
        //denglu
        NSLog(@"load");
    }
    
}
//收回键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.mobileNumTF resignFirstResponder];
    [self.passWordTF resignFirstResponder];
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
