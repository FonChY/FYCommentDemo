//
//  FYGoodsCommentFrameModel.h
//  PerfectBuyText
//
//  Created by FonChY on 16/8/12.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FYGoodsCommentModel.h"
#import <UIKit/UIKit.h>
@interface FYGoodsCommentFrameModel : NSObject
@property (nonatomic, assign) CGRect iconF;
@property (nonatomic, assign) CGRect nameF;
@property (nonatomic, assign) CGRect memberLevelF;
@property (nonatomic, assign) CGRect timeF;
@property (nonatomic, assign) CGRect lineF;
@property (nonatomic, assign) CGRect commentLevelF;
@property (nonatomic, assign) CGRect detailF;
@property (nonatomic, assign) CGFloat heightF;
@property (nonatomic, assign) CGRect imageF;
@property (nonatomic, strong) FYGoodsCommentModel *model;

@property (nonatomic, copy) NSArray *leverlFArr;
@property (nonatomic, copy) NSArray *imageFArr;
@end
