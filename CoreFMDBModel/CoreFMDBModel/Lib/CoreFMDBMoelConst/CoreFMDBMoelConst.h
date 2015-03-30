//
//  CoreFMDBMoelConst.h
//  CoreFMDBModel
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CoreFMDBMoelConst : NSObject



/**
 *  NSString
 */
UIKIT_EXTERN NSString *const CoreNSString;



/**
 *  NSInteger
 */
UIKIT_EXTERN NSString *const CoreNSInteger;



/**
 *  NSUInteger
 */
UIKIT_EXTERN NSString *const CoreNSUInteger;



/**
 *  CGFloat
 */
UIKIT_EXTERN NSString *const CoreCGFloat;



/**
 *  Enum、int
 */
UIKIT_EXTERN NSString *const CoreEnum_int;



/**
 *  BOOL:BOOL类型的变量对应sqlite中的integer方便扩展
 */
UIKIT_EXTERN NSString *const CoreBOOL;











/**
 *  SQL语句Const
 */

/**
 *  INTEGER
 */
UIKIT_EXTERN NSString *const INTEGER_TYPE;


/**
 *  TEXT
 */
UIKIT_EXTERN NSString *const TEXT_TYPE;


/**
 *  REAL
 */
UIKIT_EXTERN NSString *const REAL_TYPE;





/**
 *  其他定义
 */
/**
 *  空字符串
 */
UIKIT_EXTERN NSString *const EmptyString;


/**
 *  创建重试时间
 */
UIKIT_EXTERN CGFloat const RetryTimeForTableCreate;


/**
 *  读表字段的重试时间
 */
UIKIT_EXTERN CGFloat const RetryTimeForFieldRead;

@end
