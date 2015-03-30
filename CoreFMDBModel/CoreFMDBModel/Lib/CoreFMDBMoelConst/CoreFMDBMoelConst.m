//
//  CoreFMDBMoelConst.m
//  CoreFMDBModel
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreFMDBMoelConst.h"
#import "NSString+Stackoverflow.h"

@implementation CoreFMDBMoelConst



/**
 *  字符串
 */
NSString *const CoreNSString = @"NSString";




/**
 *  NSInteger
 */
NSString *const CoreNSInteger = @"q";



/**
 *  NSUInteger
 */
NSString *const CoreNSUInteger = @"Q";




/**
 *  CGFloat
 */
NSString *const CoreCGFloat = @"d";



/**
 *  Enum、int
 */
NSString *const CoreEnum_int = @"i";



/**
 *  BOOL
 */
NSString *const CoreBOOL = @"B";






/**
 *  SQL语句Const
 */

/**
 *  INTEGER
 */
NSString *const INTEGER_TYPE = @"INTEGER NOT NULL DEFAULT 0";


/**
 *  TEXT
 */
NSString *const TEXT_TYPE = @"TEXT NOT NULL DEFAULT ''";


/**
 *  REAL
 */
NSString *const REAL_TYPE = @"REAL NOT NULL DEFAULT 0.0";




/**
 *  其他定义
 */

/**
 *  空字符串
 */
NSString *const EmptyString = @"";


/**
 *  创建重试时间
 */
CGFloat const RetryTimeForTableCreate = 2.0f;


/**
 *  读表字段的重试时间
 */
CGFloat const RetryTimeForFieldRead = 1.0f;


@end
