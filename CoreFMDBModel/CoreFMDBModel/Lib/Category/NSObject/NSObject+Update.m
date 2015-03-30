//
//  NSObject+Update.m
//  CoreFMDBModel
//
//  Created by muxi on 15/3/30.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "NSObject+Update.h"
#import "NSObject+FMDBModelCommon.h"
#import "NSObject+Select.h"
#import "CoreFMDBModel.h"
#import "NSObject+MJIvar.h"
#import "MJIvar.h"
#import "MJType.h"
#import "CoreFMDBMoelConst.h"
#import "CoreFMDB.h"


@implementation NSObject (Update)

/**
 *  更新数据（级联更新）
 *
 *  @param model 模型数据
 *
 *  @return 执行结果
 */
+(BOOL)update:(id)model{
    
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
    
    CoreFMDBModel *fmdbModel=(CoreFMDBModel *)model;
    
    
    //查询此模型在数据库中是否存在，如果不存在，则无法更新
    id obj=[self find:fmdbModel.hostID];
    if(obj==nil) return NO;
    
    //代码运行到这里，说明在数据库中的模型数据是存在的，执行更新操作
    NSMutableString *keyValueString=[NSMutableString string];
    
    //遍历成员属性
    [self enumerateIvarsWithBlock:^(MJIvar *ivar, BOOL *stop) {
        
        //如果是过滤字段，直接跳过
        BOOL skip=[self skipField:ivar];
        
        if(!skip){
            
            NSString *sqliteTye=[self sqliteType:ivar.type.code];
            
            id value =[model valueForKeyPath:ivar.propertyName];
            
            if(![sqliteTye isEqualToString:EmptyString]){
    
                //拼接属性值
                //字符串需要再处理
                
                if([ivar.type.code isEqualToString:CoreNSString]){
                    
                    if(value == nil) value=@"";
                    
                    //添加引号表明字符串
                    value=[NSString stringWithFormat:@"'%@'",value];
                }
                
                //拼接属性名及属性值
                [keyValueString appendFormat:@"%@=%@,",ivar.propertyName,value];

            }else{
                
                //此属性是模型字段，级联更新
                if(ivar.propertyName!=nil && value!=nil){
                    
                    CoreFMDBModel *childModel=(CoreFMDBModel *)value;
                    
                    //自动处理pModel:KVO
                    [childModel setValue:NSStringFromClass(fmdbModel.class) forKey:@"pModel"];
                    
                    //自动处理pid:KVO
                    [childModel setValue:@(fmdbModel.hostID) forKey:@"pid"];
                    
                    //级联更新数据
                    BOOL childInsertRes = [NSClassFromString(ivar.type.code) update:childModel];
                    
                    if(!childInsertRes) NSLog(@"错误：级联保存数据失败！级联父类：%@，子属性为：%@",NSStringFromClass(fmdbModel.class),value);
                }
            }
        }
    }];
    
    //删除最后的字符
    NSString *keyValues_sub=[self deleteLastChar:keyValueString];
    
    //得到最终的sql
    NSString *sql=[NSString stringWithFormat:@"UPDATE %@ SET %@ WHERE hostID=%@;",NSStringFromClass(self),keyValues_sub,@(fmdbModel.hostID)];

    //执行更新
    BOOL updateRes = [CoreFMDB executeUpdate:sql];
    
    if(!updateRes) NSLog(@"错误：数据更新出错，出错模型数据为：%@",model);
    
    return updateRes;
}






/**
 *  更新数据（批量更新）
 *
 *  @param models 模型数组
 *
 *  @return 执行结果
 */
+(BOOL)updateModels:(NSArray *)models{
    
    if(models==nil || models.count==0) return NO;
    
    BOOL updateRes=YES;
    
    for (id obj in models) {
        
        BOOL res = [self update:obj];
        
        if(!res) updateRes=NO;
    }
    
    return updateRes;
}



@end
