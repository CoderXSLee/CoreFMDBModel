//
//  NSObject+Save.h
//  CoreFMDBModel
//
//  Created by muxi on 15/3/30.
//  Copyright (c) 2015年 muxi. All rights reserved.
//  保存数据，如果数据不存在，则执行添加操作；如果数据已经存在，则执行更新操作，总之数据一定会记录到数据库中并成为最新的数据记录。
//  请在主线程中执行

#import <Foundation/Foundation.h>

@interface NSObject (Save)



/**
*  保存数据（单个）
*
*  @param model 模型数据
*
*  @return 执行结果
*/
+(BOOL)save:(id)model;



@end
