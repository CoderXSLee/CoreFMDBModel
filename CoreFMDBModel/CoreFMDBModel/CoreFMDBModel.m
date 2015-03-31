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








@end
