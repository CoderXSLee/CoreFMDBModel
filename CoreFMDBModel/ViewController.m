//
//  ViewController.m
//  CoreFMDBModel
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "ViewController.h"
#import "NewsListModel.h"
#import "CoreFMDB.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //create
//    [self create];
    
    
    //insert
//    [self insert];
    
//    //inserts
//    [self inserts];
//
//    //select
//    [self select];
//
//    //find
//    [self find];
//    
//    //delete
//    [self deletes];
    
    //update
//    [self update];
    
//    [self save];
    
    [self contrast];
}

-(void)contrast{
    
    NewsListModel *newsListModel7 = [self modelWithStart:7 num:1].firstObject;
    NewsListModel *newsListModel8 = [self modelWithStart:8 num:1].firstObject;
    
    NSArray *arr1=@[newsListModel7,newsListModel8];
    
    
    NewsListModel *newsListModel9 = [self modelWithStart:7 num:1].firstObject;
    newsListModel9.title=@"我是标题";
    NewsListModel *newsListModel10 = [self modelWithStart:8 num:1].firstObject;
    
    NSArray *arr2=@[newsListModel10,newsListModel9];
    
    
    
    BOOL res = [NewsListModel contrastModels1:arr1 models2:arr2];
    
    if(res){
        NSLog(@"一样");
    }else{
        NSLog(@"不一样");
    }
}


-(void)save{
    
    NewsListModel *newsListModel20 = [self modelWithStart:20 num:1].firstObject;
    newsListModel20.title=@"新的题目20";
    newsListModel20.content=@"20的最新的内容哈";
    
    newsListModel20.author.name =@"我是作者名20";
    newsListModel20.author.hobby.desc=@"写作20";
    
    [NewsListModel save:newsListModel20];
}




/**
 *  update
 */
-(void)update{
    
    NewsListModel *newsListModel7 = [self modelWithStart:7 num:1].firstObject;
    newsListModel7.title=@"新的题目7";
    newsListModel7.content=@"7的最新的内容哈";
    
    newsListModel7.author.name =@"我是作者名7";
    newsListModel7.author.hobby.desc=@"写作7";
    
    
    NewsListModel *newsListModel9 = [self modelWithStart:9 num:1].firstObject;
    newsListModel9.title=@"新的题目9";
    newsListModel9.content=@"9的最新的内容哈";
    
    newsListModel9.author.name =@"我是作者名9";
    newsListModel9.author.hobby.desc=@"写作9";

    [NewsListModel updateModels:@[newsListModel7,newsListModel9]];

}


/**
 *  delete
 */
-(void)deletes{
//    [NewsListModel delete:10];
}



-(void)create{
    NewsListModel *newsListModel = [[NewsListModel alloc] init];
    
}



/**
 *  find
 */
-(void)find{
    
    NewsListModel *newsModel=[NewsListModel find:8];
    
}



-(void)select{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *where=@"id<20";
        
        NSString *groupBy=@"hostID";
        NSString *orderBy=@"id desc";
        NSString *limit=@"10";
        
        NSArray *array=[NewsListModel selectWhere:where groupBy:nil orderBy:nil limit:nil];
    });
}


-(void)insert{
    
    NewsListModel *newsListModel=[self modelWithStart:1 num:1].firstObject;
    
    [NewsListModel insert:newsListModel];

}



/**
 *  inserts
 */
-(void)inserts{
    
    NSArray *models=[self modelWithStart:1 num:10];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NewsListModel inserts:models];
//    });
}



-(NSArray *)modelWithStart:(NSUInteger)start num:(NSUInteger)num{
    
    NSMutableArray *models=[NSMutableArray array];
    NSUInteger end=start + num;
    
    for (NSInteger i=start; i<=end; i++) {
        
        NewsListModel *newsListModel = [[NewsListModel alloc] init];
        newsListModel.title=[NSString stringWithFormat:@"新闻标题%@",@(i)];
        newsListModel.content=[NSString stringWithFormat:@"新闻内容%@",@(i)];
        newsListModel.score=7.8f;
        
        AuthorModel *authorModel=[[AuthorModel alloc] init];
        authorModel.name=[NSString stringWithFormat:@"张三%@",@(i)];
        authorModel.age=40;
        authorModel.hostID=i;
        
        HobbyModel *hobby=[[HobbyModel alloc] init];
        hobby.desc=[NSString stringWithFormat:@"旅游%@",@(i)];
        hobby.cost=3000.0f;
        hobby.hostID=i;
        
        authorModel.hobby=hobby;
        
        newsListModel.author=authorModel;
        
        newsListModel.hostID=i;
        
        [models addObject:newsListModel];
    }
    
    return models;
}



@end
