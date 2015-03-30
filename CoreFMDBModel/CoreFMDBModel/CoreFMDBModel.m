//
//  CoreFMDBModel.m
//  CoreFMDBModel
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreFMDBModel.h"
#import "NSObject+MJIvar.h"
#import "MJIvar.h"
#import "MJType.h"
#import "CoreFMDBMoelConst.h"
#import "CoreFMDB.h"
#import "NSObject+MJKeyValue.h"
#import "NSObject+Create.h"




@implementation CoreFMDBModel

+(void)initialize{

    //自动创表
    [self tableCreate];
}


/*
 *  模型的hostID<->服务器id
 */
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"hostID":@"id"};
}




///**
// *  查询数据
// *
// *  @param where            where
// *  @param groupBy          groupBy
// *  @param orderBy          orderBy
// *  @param limit            limit
// *  @param selectResBlock   结果数组
// */
//+(void)selectUseWhere:(NSString *)where groupBy:(NSString *)groupBy orderBy:(NSString *)orderBy limit:(NSString *)limit selectResBlock:(void(^)(NSArray *selectRes))selectResBlock{
//    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        
//        NSMutableString *sqlM=[NSMutableString stringWithFormat:@"SELECT * FROM %@",NSStringFromClass(self)];
//        
//        //where
//        if(where != nil) [sqlM appendFormat:@" WHERE %@",where];
//        
//        //groupBy
//        if(groupBy != nil) [sqlM appendFormat:@" GROUP BY %@",groupBy];
//        
//        //orderBy
//        if(orderBy != nil) [sqlM appendFormat:@" ORDER BY %@",orderBy];
//        
//        //limit
//        if(limit != nil) [sqlM appendFormat:@" LIMIT %@",limit];
//        
//        //结束添加分号
//        NSString *sql=[NSString stringWithFormat:@"%@;",sqlM];
//        
//        //执行查询
//        [self select:sql selectResBlock:selectResBlock];
//    });
//}


//+(void)select:(NSString *)sql selectResBlock:(void(^)(NSArray *selectRes))selectResBlock{
//    
//    //执行查询前，需要判断表是否已经存在，因为首次执行添加可能因为表还没有及时创建而导致查询数据失败
//    [self checkTableExists:^(BOOL tableExists) {
//        
//        if(tableExists){
//            
//            [CoreFMDB executeQuery:sql queryResBlock:^(FMResultSet *set) {
//                
//                NSMutableArray *selectModels=[NSMutableArray array];
//                
//                while ([set next]) {
//                    
//                    CoreFMDBModel *model=[[self alloc] init];
//                    
//                    __block NSMutableArray *modelIvarArray=[NSMutableArray array];
//                    
//                    //遍历成员属性
//                    [self enumerateIvarsWithBlock:^(MJIvar *ivar, BOOL *stop) {
//                        
//                        BOOL skip=[self skipField:ivar];
//                        
//                        if(!skip){
//                            
//                            NSString *sqliteTye=[self sqliteType:ivar.type.code];
//                            
//                            if(![sqliteTye isEqualToString:emptyString]){
//                                
//                                NSString *propertyName = ivar.propertyName;
//                                NSString *value=[set stringForColumn:propertyName];
//                                
//                                //设置值
//                                [model setValue:value forKey:propertyName];
//                                
//                            }else{//此处是模型字段
//                                
//                                [modelIvarArray addObject:ivar];
//                            }
//                        }
//                    }];
//                    
//                    //添加
//                    [selectModels addObject:model];
//                    
//                    
//                    if(modelIvarArray.count!=0){//说明有模型字段
//
//                        //遍历成员属性
//                        [modelIvarArray enumerateObjectsUsingBlock:^(MJIvar *ivar, NSUInteger idx, BOOL *stop) {
//                            
//                            BOOL skip=[self skipField:ivar];
//                            
//                            if(!skip){
//                                
//                                NSString *sqliteTye=[self sqliteType:ivar.type.code];
//                                
//                                if([sqliteTye isEqualToString:emptyString]){
//                                    //查询出模型字段
//                                    //模型字段的类
//                                    Class ModelClass=NSClassFromString(ivar.type.code);
//                                    
//                                    //where:
//                                    NSString *where=[NSString stringWithFormat:@"pModel='%@' AND pid=%@",NSStringFromClass(model.class),@(model.hostID)];
//                                    
//                                    NSString *limit=@"1";
//                                    
//                                    [ModelClass selectUseWhere:where groupBy:nil orderBy:nil limit:limit selectResBlock:^(NSArray *selectRes) {
//                                        
//                                        [model setValue:selectRes.firstObject forKey:ivar.propertyName];
//                                    }];
//                                }
//                            }
//                        }];
//                    }else{
//                        
//                    }
//                }
//                
//                selectResBlock(selectModels);
//            }];
//            
//        }else{
//            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(retryTimeForTableCreate * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                [self select:sql selectResBlock:selectResBlock];
//            });
//        }
//    }];
//}


//+(NSArray *)selectWhere:(NSString *)where groupBy:(NSString *)groupBy orderBy:(NSString *)orderBy limit:(NSString *)limit{
//    
//    NSMutableString *sqlM=[NSMutableString stringWithFormat:@"SELECT * FROM %@",NSStringFromClass(self)];
//    
//    //where
//    if(where != nil) [sqlM appendFormat:@" WHERE %@",where];
//    
//    //groupBy
//    if(groupBy != nil) [sqlM appendFormat:@" GROUP BY %@",groupBy];
//    
//    //orderBy
//    if(orderBy != nil) [sqlM appendFormat:@" ORDER BY %@",orderBy];
//    
//    //limit
//    if(limit != nil) [sqlM appendFormat:@" LIMIT %@",limit];
//    
//    //结束添加分号
//    NSString *sql=[NSString stringWithFormat:@"%@;",sqlM];
//    
//    NSMutableArray *arrayM=[NSMutableArray array];
//    
//    NSMutableArray *fieldsArrayM=[NSMutableArray array];
//    
//    [[CoreFMDB sharedCoreFMDB].queue inDatabase:^(FMDatabase *db) {
//        
//        FMResultSet *set = [db executeQuery:sql];
//        
//        
//        
//        while ([set next]) {
//            
//            CoreFMDBModel *model=[[self alloc] init];
//            
//            [self enumerateIvarsWithBlock:^(MJIvar *ivar, BOOL *stop) {
//                
//                
//                BOOL skip=[self skipField:ivar];
//                
//                if(!skip){
//                    
//                    NSString *sqliteTye=[self sqliteType:ivar.type.code];
//                    
//                    if(![sqliteTye isEqualToString:emptyString]){
//                        
//                        NSString *propertyName = ivar.propertyName;
//                        NSString *value=[set stringForColumn:propertyName];
//                        
//                        //设置值
//                        [model setValue:value forKey:propertyName];
//
//                    }else{
//                        [fieldsArrayM addObject:ivar];
//                    }
//                }
//
//            }];
//            
//            
//            
//            [arrayM addObject:model];
//        }
//    }];
//    
//    
//    [arrayM enumerateObjectsUsingBlock:^(CoreFMDBModel *model, NSUInteger idx, BOOL *stop) {
//        
//        [fieldsArrayM enumerateObjectsUsingBlock:^(MJIvar *ivar, NSUInteger idx, BOOL *stop) {
//            
//            CoreFMDBModel *childModel=[NSClassFromString(ivar.type.code) selectWhere:@"pid=1" groupBy:nil orderBy:nil limit:@"1"].firstObject;
//            
//            [model setValue:childModel forKey:ivar.propertyName];
//        }];
//        
//    }];
//    
//    return arrayM;
//}


@end
