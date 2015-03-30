//
//  HobbyModel.h
//  CoreFMDBModel
//
//  Created by 沐汐 on 15-3-28.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreFMDBModel.h"
#import <UIKit/UIKit.h>

@interface HobbyModel : CoreFMDBModel

@property (nonatomic,copy) NSString *desc;

@property (nonatomic,assign)  CGFloat cost;

@end
