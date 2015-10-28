//
//  ZZYMainTableViewCell.m
//  爆笑姐夫
//
//  Created by MS on 15-10-8.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#import "ZZYMainTableViewCell.h"
#import "ZZYStatusFrame.h"
#import "ZZYStatus.h"
#import "ZZYItemView.h"
#import "UIImageView+WebCache.h"
#import <MediaPlayer/MediaPlayer.h>

/** 播放按钮的尺寸 */
#define PLAYBUTTONFRAME 55
@interface ZZYMainTableViewCell()
{
    /** 声明视频播放器控件 */
    MPMoviePlayerViewController * _playerController;
}

//注:其他不需要在数据源获得数据的控件在下面单独创建


/** cell工具条父控件 */
@property (nonatomic ,weak) UIView * statusView;

/** 顶部标题 */
@property (nonatomic, weak) UILabel * nameLabel;

/** 顶 */
@property (nonatomic, weak) UILabel * upNumLabel;

/** 砸 */
@property (nonatomic, weak) UILabel * downNumLabel;

/** 评论 */
@property (nonatomic, weak) UILabel * commentNumLabel;

/** 分享 */
@property (nonatomic, weak) UILabel * shareNumLabel;

/** 中间界面父控件 */
@property (nonatomic ,weak) UIView * centerView;

/** 图片上部的长条 */
@property (nonatomic ,weak) UIView * smallView;

/** 图片 */
@property (nonatomic, weak) UIImageView * image;

/** 视频播放次数 */
@property (nonatomic, weak) UILabel * clickNumLabel;

/** 视频播放时间 */
@property (nonatomic, weak) UILabel * playTimeLabel;

//cell工具条按钮
/** 顶 */
@property (nonatomic, weak) UIButton * upNumButton;

/** 砸 */
@property (nonatomic, weak) UIButton * downNumButton;

/** 评论 */
@property (nonatomic, weak) UIButton * commentNumButton;

/** 分享 */
@property (nonatomic, weak) UIButton * shareNumButton;

/** 视频播放 */
@property (nonatomic, weak) UIButton * videoPlayButton;

/** 图片播放 */
@property (nonatomic, weak) UIButton * imagePlayButton;

@end

@implementation ZZYMainTableViewCell

/**
 *  构造方法(在初始化对象的时候会调用)
 *  一般在这个方法中添加需要显示的子控件
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.添加中间界面控件和标题
        [self createUI];
        //2.添加cell的工具条
        [self createStatus];
    }
    return self;
}

/**
 *  添加中间界面控件和标题
 */

- (void)createUI
{
    //给cell创建整个的一个View作为背景
    UIView * backView = [[UIView alloc]init];
    backView.backgroundColor = [UIColor whiteColor];
    self.backgroundView = backView;
    
    //1.创建顶部标题
     UILabel * nameLabel  = [[UILabel alloc]init];
    nameLabel.numberOfLines = 0;//设置自动换行
//    nameLabel.userInteractionEnabled = NO;
    [self.contentView addSubview:nameLabel];//注意书写方式
    self.nameLabel = nameLabel;
    
    //2.中间界面父控件
    UIView * view = [[UIView alloc]init];
    [self.contentView addSubview:view];
    self.centerView = view;
    
    //3.图像
    UIImageView * image = [[UIImageView alloc]init];
    [self.centerView addSubview:image];//注意父控件的对象
    self.image = image;
    self.image.userInteractionEnabled = YES;//如果不设置的话，放到imageView上的按钮的点击事件会被cell拦截
    
    //4.图像中间的按钮
    UIButton * videoPlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [videoPlayButton setImage:[UIImage imageNamed:@"videoplay_1.png"] forState:UIControlStateNormal];
    [videoPlayButton setImage:[UIImage imageNamed:@"videoplay_2.png"] forState:UIControlStateSelected];
    [videoPlayButton addTarget:self action:@selector(videoPlayButton:) forControlEvents:UIControlEventTouchDown];
    self.videoPlayButton = videoPlayButton;
    [self.image addSubview:self.videoPlayButton];
    
    UIButton * imagePlayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [imagePlayButton setImage:[UIImage imageNamed:@"gifplay_1.png"] forState:UIControlStateNormal];
    [imagePlayButton setImage:[UIImage imageNamed:@"gifplay_2.png"] forState:UIControlStateSelected];
    [imagePlayButton addTarget:self action:@selector(imagePlayButton:) forControlEvents:UIControlEventTouchDown];
    self.imagePlayButton = imagePlayButton;
    [self.image addSubview:self.imagePlayButton];

    

    //5.图片上部长条View存放视频特有的label，应该以image为父控件，否则一点击image就会看不清楚
 
    UIView * smallView = [[[NSBundle mainBundle]loadNibNamed:@"labelViewInImage" owner:nil options:nil]lastObject];
    smallView.backgroundColor = [UIColor clearColor];
    [self.image addSubview:smallView];
    self.smallView = smallView;
    
    //播放次数
    self.clickNumLabel = (UILabel *)[smallView viewWithTag:301];
    //播放时长
    self.playTimeLabel = (UILabel *)[smallView viewWithTag:302];
    
}
/**
 *  cell工具条
 */
- (void)createStatus
{
    UIView * statusView = [[[NSBundle mainBundle]loadNibNamed:@"CellStatusView" owner:nil options:nil]lastObject];
    [self.contentView addSubview:statusView];
    self.statusView = statusView;
    //Label
    //顶
    self.upNumLabel = (UILabel *)[statusView viewWithTag:101];
    //砸
    self.downNumLabel = (UILabel *)[statusView viewWithTag:102];
    //评论
    self.commentNumLabel = (UILabel *)[statusView viewWithTag:103];
    //分享
    self.shareNumLabel = (UILabel *)[statusView viewWithTag:104];
    //Button
    //顶
    self.upNumButton = (UIButton *)[statusView viewWithTag:201];
    [self.upNumButton addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    //砸
    self.downNumButton = (UIButton *)[statusView viewWithTag:202];
    [self.downNumButton addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    //评论
    self.commentNumButton = (UIButton *)[statusView viewWithTag:203];
    [self.commentNumButton addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    //分享
    self.shareNumButton = (UIButton *)[statusView viewWithTag:204];
    [self.shareNumButton addTarget:self action:@selector(pressBtn:) forControlEvents:UIControlEventTouchUpInside];
    
}
/**
 *  cell工具条的按钮，点击按钮分别顶、砸、评论、分享
 */
- (void)pressBtn:(UIButton *)button
{
    switch (button.tag) {
        case 201:
            NSLog(@"ding");
            break;
        case 202:
            NSLog(@"za");
            break;
        case 203:
            NSLog(@"comment");
            break;
        case 204:
            NSLog(@"share");
            break;
        default:
            break;
    }
}
/**
 *  video播放按钮
 */
- (void)videoPlayButton:(UIButton *)button
{
    button.selected = YES;
    
    NSURL * url = [NSURL URLWithString:self.statusFrame.status.itemView.gifPath];
    _playerController = [[MPMoviePlayerViewController alloc]initWithContentURL:url];
    _playerController.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    //设置视频播放器大小与图片大小一致
    _playerController.view.frame = self.statusFrame.mainPicPathFrame;
    //将视频播放器添加到图片的父控件处
    [self.centerView addSubview:_playerController.view];
    
    //设置视频播放器的样式
    _playerController.moviePlayer.controlStyle = MPMovieControlStyleEmbedded;
    
    //播放视频
    [_playerController.moviePlayer prepareToPlay];
    [_playerController.moviePlayer play];
    
    //监听视频播放是否结束－－－－注意不要忽略
    [self moviePlayerNotification];
}
/**
 * 监听视频播放是否结束
 */
- (void)moviePlayerNotification
{
    //监听视频播放结束
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieStop) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
}
//视频播放结束
- (void)movieStop
{
    self.videoPlayButton.selected = NO;//有YES就有no
    self.videoPlayButton.hidden = YES;
    [_playerController.view removeFromSuperview];
}

/**
 *  image播放按钮
 */
- (void)imagePlayButton:(UIButton *)button
{
    NSLog(@"imagePlay");
    NSURL * url = [NSURL URLWithString:self.statusFrame.status.itemView.gifPath];
    NSURLRequest * request = [[NSURLRequest alloc]initWithURL:url];
    UIWebView * webView = [[UIWebView alloc]initWithFrame:self.statusFrame.mainPicPathFrame];
    webView.userInteractionEnabled = NO;
    [self.centerView addSubview:webView];
    
    [webView loadRequest:request];
    
}
/**
 *  在这个方法中设置子控件的frame和显示数据--重写StatusFrame的set方法
 */
-(void)setStatusFrame:(ZZYStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    //1.设置数据
    [self settingData];
    
    //2.设置frame
    [self settingFrame];
}

/**
 *  设置数据
 */
- (void)settingData
{
    //网络数据
    ZZYStatus * status = self.statusFrame.status;
    //1.标题
    self.nameLabel.text = status.title;
    
    //2.图片
    [self.image sd_setImageWithURL:[NSURL URLWithString:status.mainPicPath]];
    //视频特有的数据
    if ([status.mediaType isEqualToString:@"2"]) {
        //3.图片上部长条View存放视频特有的label
        self.clickNumLabel.text = status.clickNum;
        self.playTimeLabel.text = status.itemView.playTime;
    }
    
    //4.cell工具条数据
    self.upNumLabel.text = status.upNum;
    self.downNumLabel.text = status.downNum;
    self.commentNumLabel.text = status.commentNum;
    self.shareNumLabel.text = status.shareNum;
}

/**
 *  设置frame
 */
- (void)settingFrame
{
    //1.标题
    self.nameLabel.frame = self.statusFrame.titleFrame;
    
    //2.中间父控件
    self.centerView.frame = self.statusFrame.centerViewFrame;
    
    //3.图片
    self.image.frame = self.statusFrame.mainPicPathFrame;
    
    //视频特有的数据---记得设置显示状态，否则由于cell的复用会发生错误
    if ([self.statusFrame.status.mediaType isEqualToString:@"2"]) {
        self.smallView.hidden = NO;
        //4.图片上部长条View存放视频特有的label
        self.smallView.frame = self.statusFrame.VideoLabelFrame;
       // self.clickNumLabel.frame = self.statusFrame.clickNumFrame;
        
        //5.视频播放按钮设置frame
        self.videoPlayButton.hidden = NO;
        self.imagePlayButton.hidden = YES;//设置隐藏属性防止cell复用发生错误
        self.videoPlayButton.frame = CGRectMake(0, 0, PLAYBUTTONFRAME, PLAYBUTTONFRAME);
        self.videoPlayButton.center = self.image.center;
    }
    else
    {
        self.smallView.hidden = YES;
        self.videoPlayButton.hidden = YES;
        self.imagePlayButton.hidden = NO;
        self.imagePlayButton.frame = CGRectMake(0, 0, PLAYBUTTONFRAME, PLAYBUTTONFRAME);
        self.imagePlayButton.center = self.image.center;

    }
    
    //6.cell的工具条
    self.statusView.frame = self.statusFrame.cellStatusFrame;
   
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString * ID = @"status";
    ZZYMainTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[ZZYMainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //设置cell点击时的效果---此处要注意
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
