//
//  NewsListModel.h
//  CoreFMDBModel
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreFMDBModel.h"
#import <UIKit/UIKit.h>
#import "AuthorModel.h"

typedef enum {
    
    /**
     *  最普通的新闻
     */
    NewsListModelTypeNews=0,
    
    /**
     *  社会新闻
     */
    NewsListModelTypeSocial,
    
    /**
     *  电影新闻
     */
    NewsListModelTypeMovie,
    
    /**
     *  影音新闻
     */
    NewsListModelTypeMedia,
    
    
}NewsListModelType;


@interface NewsListModel : CoreFMDBModel

@property (nonatomic,copy) NSString *title,*content,*time,*intro,*editor;

@property (nonatomic,assign) NSInteger clickCount,browerCount;

@property (nonatomic,assign) CGFloat score;

@property (nonatomic,assign) NewsListModelType newsType;

@property (nonatomic,assign) int status;

@property (nonatomic,assign) BOOL canComment;





/**
 *  增加字段
 */
/**
 *  作者评语
 */
@property (nonatomic,copy) NSString *comment;

@property (nonatomic,assign) CGFloat price;

@property (nonatomic,assign) NSInteger commentPeople;

@property (nonatomic,copy) NSString *checkMan;

@property (nonatomic,copy) NSString *checkDepartment;

@property (nonatomic,assign) BOOL isShow;



/**
 *  模型字段
 */
@property (nonatomic,strong) AuthorModel *author;


@end
