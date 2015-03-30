//
//  AuthorModel.h
//  CoreFMDBModel
//
//  Created by muxi on 15/3/27.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CoreFMDBModel.h"
#import "HobbyModel.h"
#import "IndustryModel.h"

@interface AuthorModel : CoreFMDBModel

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) NSUInteger age;

@property (nonatomic,strong) HobbyModel *hobby;

@property (nonatomic,assign) IndustryModel *industry;

@property (nonatomic,copy) NSString *penName;

@end
