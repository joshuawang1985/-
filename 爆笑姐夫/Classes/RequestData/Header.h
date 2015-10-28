//
//  Header.h
//  爆笑姐夫
//
//  Created by MS on 15-10-6.
//  Copyright (c) 2015年 张志远. All rights reserved.
//

#ifndef _____Header_h
#define _____Header_h

//精选界面接口
#define CHOSEPATH @"http://api.jiefu.tv/app2/api/article/list.html?pageNum=%d&versionNo=203&sourceType=1&bisRecommend=1&pageSize=20&deviceCode=866058021039673"
//图片界面接口
#define IMAGEPATH @"http://api.jiefu.tv/app2/api/article/list.html?pageNum=%d&versionNo=203&mediaType=1&sourceType=1&pageSize=20&deviceCode=866058021039673"
//视频接口
#define VIDEOPATH @"http://api.jiefu.tv/app2/api/article/list.html?pageNum=%d&versionNo=203&mediaType=2&sourceType=1&pageSize=20&deviceCode=866058021039673"
//最新界面接口
#define NEWSPATH @"http://api.jiefu.tv/app2/api/article/list.html?pageNum=%d&versionNo=203&sourceType=1&pageSize=20&deviceCode=866058021039673&tagId=211"
 //最热界面接口
#define HOTPATH @"http://api.jiefu.tv/app2/api/article/hotList.html?pageNum=%d&versionNo=203&sourceType=1&pageSize=20&deviceCode=866058021039673"
//热门分类接口
#define CLASSESPATH @"http://api.jiefu.tv/app2/api/article/type/list.html?versionNo=203&sourceType=1&deviceCode=866058021039673"
//热门分类接口详细界面
#define CLASSESDETAIL @"http://api.jiefu.tv/app2/api/article/list.html?pageNum=%d&versionNo=203&sourceType=1&pageSize=20&deviceCode=866058021039673&&typeId="
//热门关键字界面接口
#define HOTKEYPATH @"http://api.jiefu.tv/app2/api/article/tag/list.html?versionNo=203&sourceType=1&deviceCode=866058021039673"
//热门关键字界面详细接口
#define HOTKEYDETAIL @"http://api.jiefu.tv/app2/api/article/list.html?pageNum=%d&versionNo=203&sourceType=1&pageSize=20&deviceCode=866058021039673&tagId="

//cell点击详细接口
#define CELLDETAIL @"http://api.jiefu.tv/app2/api/article/detail.html?sourceId=1&deviceCode=866058021039673&versionNo=203&id="
#endif
