//
//  NSObject+Save.m
//  CoreFMDBModel
//
//  Created by muxi on 15/3/30.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSObject+Save.h"
#import "CoreFMDBModel.h"
#import "NSObject+Select.h"
#import "NSObject+FMDBModelCommon.h"
#import "NSObject+Insert.h"
#import "NSObject+Update.h"

@implementation NSObject (Save)

/**
 *  保存数据（单个）
 *
 *  @param model 模型数据
 *
 *  @return 执行结果
 */
+(BOOL)save:(id)model{
    
    //检查表是否存在，如果不存在，直接返回
    if(![self checkTableExists]){
        NSLog(@"错误：你操作的模型%@在数据库中没有对应的数据表！",NSStringFromClass(self));
        return NO;
    }
    
    if(![NSThread isMainThread]){
        NSLog(@"错误：为了数据安全，数据更新API必须在主线程中执行！");
        return NO;
    }
    
    if(![model isKindOfClass:[self class]]){
        NSLog(@"错误：插入数据请使用%@模型类对象，您使用的是%@类型",NSStringFromClass(self),[model class]);
        return NO;
    }
    
    CoreFMDBModel *fmdbModel = (CoreFMDBModel *)model;
    
    CoreFMDBModel *dbModel=[self find:fmdbModel.hostID];
    
    BOOL saveRes=NO;
    
    if(dbModel==nil){//要保存的数据不存在，执行添加操作
        NSLog(@"现在是新增");
        saveRes = [self insert:fmdbModel];
        
    }else{//要保存的数据存在，执行更新操作
        NSLog(@"现在是更新");
        saveRes = [self update:fmdbModel];
        
    }
    
    return saveRes;
}



@end
