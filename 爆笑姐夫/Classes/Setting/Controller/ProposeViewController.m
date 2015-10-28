//
//  ProposeViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-6.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ProposeViewController.h"

@interface ProposeViewController ()<UITextViewDelegate>
@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *placeholderLabel;
- (IBAction)buttonClick:(id)sender;

@end

@implementation ProposeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐藏tabBar
    self.tabBarController.tabBar.hidden = YES;
}
//创建一个label，通过textView的代理方法来实现label的显示、隐藏－－从而实现textView蕾丝placeholder的效果
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    self.placeholderLabel.hidden = YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (self.textView.text.length == 0) {
        self.placeholderLabel.hidden = NO;
    }
    else
    {
        self.placeholderLabel.hidden = YES;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonClick:(id)sender {
}
@end
