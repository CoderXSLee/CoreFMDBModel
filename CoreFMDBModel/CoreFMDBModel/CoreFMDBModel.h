//
//  CoreFMDBModel.h
//  CoreFMDBModel
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Insert.h"
#import "NSObject+Select.h"
#import "NSObject+Delete.h"
#import "NSObject+Update.h"
#import "NSObject+Save.h"

@interface CoreFMDBModel : NSObject


/**
 *  服务器数据的ID
 */
@property (nonatomic,assign) NSUInteger hostID;


/*
 *  父级模型名称：此属性用于完成级联添加以及查询，框架将自动处理，请不要手动修改！
 */
@property (nonatomic,copy,readonly) NSString *pModel;

/*
 *  父模型的hostID：此属性用于完成级联添加以及查询，框架将自动处理，请不要手动修改！
 */
@property (nonatomic,assign,readonly) NSUInteger pid;


























///**
// *  查询数据(直接写条件，无需带关键字)
// *
// *  @param where            where
// *  @param groupBy          groupBy
// *  @param orderBy          orderBy
//  *  @param limit            limit
// *  @param selectResBlock   结果数组
// */
//+(void)selectUseWhere:(NSString *)where groupBy:(NSString *)groupBy orderBy:(NSString *)orderBy limit:(NSString *)limit selectResBlock:(void(^)(NSArray *selectRes))selectResBlock;
//
//
//




@end
