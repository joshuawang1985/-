//
//  ZZYTabBarViewController.m
//  爆笑姐夫
//
//  Created by MS on 15-10-5.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYTabBarViewController.h"
#import "ZZYMainViewController.h"
#import "ZZYSearchViewController.h"
#import "ZZYMyViewController.h"
#import "ZZYSettingViewController.h"
#import "MyTabBar.h"
@interface ZZYTabBarViewController ()<ZZYTabBarDelegate>
/**
 *   自定义tabBar
 */
@property (nonatomic, weak) MyTabBar * myTabBar;//为什么用weak？

@end

@implementation ZZYTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化tabBar
     [self setupTabBar];
    
    //初始化所有的子控制器
    [self setupAllChildViewControllers];
    
}
//注意删除系统自带的tabbarButton在这个方法中进行
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //删除系统自动生成的UITabBarButton
    for (UIView * child in self.tabBar.subviews) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

//tabBar开始出错原因  tabBar的controller和view混了
/**
 *  初始化tabbar
 */
- (void)setupTabBar
{
    MyTabBar * customTabBar = [[MyTabBar alloc]init];
    customTabBar.frame = self.tabBar.bounds;//？？
    customTabBar.delegate = self;//实现代理方法时不要忘记设置代理
    [self.tabBar addSubview:customTabBar];
    customTabBar.backgroundColor = [UIColor whiteColor];//设置背景颜色为白色，否则当滑动table是会有一个透明的效果
    self.myTabBar = customTabBar;
    
}

/**
 *  初始化所有的子控制器
 */
- (void)setupAllChildViewControllers
{
    //<1>找到plist文件路径
    NSString * path = [[NSBundle mainBundle]pathForResource:@"爆笑姐夫" ofType:@"plist"];
    NSDictionary * allDic = [NSDictionary dictionaryWithContentsOfFile:path];
    //<2>定义所有的键值对
    NSArray * keyArr = @[@"one",@"two",@"three",@"four"];
    //<3>遍历字典获取所需内容
    for (int i = 0; i < allDic.count; i ++)
    {
        NSDictionary * smallDic = [allDic objectForKey:keyArr[i]];
        //<4>获取控制器的名称
        NSString * controllersStr = [smallDic objectForKey:@"controllerName"];
        //<5>将字符串名称的视图控制器转换成类名
        Class controllerClass = NSClassFromString(controllersStr);
        //<6>创建视图控制器对象
        UIViewController * viewCtr = [[controllerClass alloc]init];
        //<8>初始化一个子控制器---自定义一个方法，方便修改
//        viewCtr.tabBarItem.title = smallDic[@"titleName"];
//        viewCtr.tabBarItem = [[UITabBarItem alloc]initWithTitle:smallDic[@"titleName"] image:[UIImage imageNamed:smallDic[@"imageName"]] selectedImage:[UIImage imageNamed:smallDic[@"selectedImage"]]];
   
        [self setupChildViewController:viewCtr title:smallDic[@"titleName"] imageName:smallDic[@"imageName"] selectImageName:smallDic[@"selectedImage"]];
    }
}

/**
 *  初始化一个子控制器
 *
 *  @param childVc           需要初始化的子控制器
 *  @param title             标题
 *  @param imageName         图标
 *  @param selectedImageName 选中的图标
 */
- (void)setupChildViewController:(UIViewController *)childVc title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectImageName
{
    //<1>设置控制器的属性
    childVc.title = title;
    
    //设置图标
    childVc.tabBarItem.image = [UIImage imageNamed:imageName];
    //设置选中的图标
    UIImage * selectImage = [UIImage imageNamed:selectImageName];
    childVc.tabBarItem.selectedImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//取消默认的渲染效果(默认的渲染效果，选中为蓝色)
   
    //<2>包装一个导航控制器
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:childVc];
//    nav.navigationBar.backgroundColor = [UIColor redColor];//这样设置颜色会使颜色不正
    //设置导航条的背景颜色为红色
    nav.navigationBar.barTintColor = [UIColor redColor];
//修改导航条文字的背景颜色在此处没有效果－－－放到每个controller中进行设置
//    [nav.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [self addChildViewController:nav];
    
    //<3>添加tabBar内部的按钮-----不要忽略
    [self.myTabBar addTabBarButtonWithItem:childVc.tabBarItem];
}
/**
 *  监听tabbar按钮的改变
 *  @param from   原来选中的位置
 *  @param to     最新选中的位置
 */
-(void)tabBar:(MyTabBar *)tabBar didSelectedButtonFrom:(int)from to:(int)to
{
    self.selectedIndex = to;
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
