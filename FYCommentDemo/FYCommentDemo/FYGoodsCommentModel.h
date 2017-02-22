//
//  FYGoodsCommentModel.h
//  PerfectBuyText
//
//  Created by FonChY on 16/8/12.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FYGoodsCommentModel : NSObject
@property (nonatomic, copy) NSString *iconUrl;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *memberLevel;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *commentLevel;
@property (nonatomic, copy) NSString *detail;
@property (nonatomic, copy) NSArray *imageArr;
@end
