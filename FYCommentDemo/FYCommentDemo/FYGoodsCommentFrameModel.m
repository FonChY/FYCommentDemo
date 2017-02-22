//
//  FYGoodsCommentFrameModel.m
//  PerfectBuyText
//
//  Created by FonChY on 16/8/12.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import "FYGoodsCommentFrameModel.h"
#define FYSetFont(value)      [UIFont systemFontOfSize:value]
#define kScreenW     [UIScreen mainScreen].bounds.size.width
#define kScreenH     [UIScreen mainScreen].bounds.size.height
//适配
#define  KadapterW   [UIScreen mainScreen].bounds.size.width/375
#define  KadapterH   [UIScreen mainScreen].bounds.size.height/667
@implementation FYGoodsCommentFrameModel
- (void)setModel:(FYGoodsCommentModel *)model{
    _model = model;
    self.iconF = CGRectMake(15, 15, 30, 30);
    //先获取时间的宽度
   CGSize timeSize = [self sizeWithText:model.time textFont:FYSetFont(13) MaxSize:CGSizeMake(kScreenW / 2, 100)];
    CGSize nameSize = [self sizeWithText:model.name textFont:FYSetFont(13) MaxSize:CGSizeMake( kScreenW - timeSize.width - 16 - 5 -10 - 15 - 30, 100)];
    //把两边所有的空地方都剪掉
    self.nameF = CGRectMake(CGRectGetMaxX(self.iconF) + 10, 15,nameSize.width, 30);
    self.timeF = CGRectMake(kScreenW - timeSize.width - 10, 15, timeSize.width, 30);
    
    
    
    self.memberLevelF = CGRectMake(CGRectGetMaxX(self.nameF) + 5, 16 * 0.5 + 15, 16, 16);

    self.lineF = CGRectMake(0, CGRectGetMaxY(self.iconF) + 15, kScreenW, 1);
    
    self.commentLevelF = CGRectMake(0, CGRectGetMaxY(self.lineF) + 10, kScreenW, 36);
    
    
    //级别的星星的布局数组
    CGFloat levelW = 16;
    CGFloat levelY = CGRectGetMaxY(self.lineF) + 10+ levelW/2;
    NSMutableArray *levelTempArr = [NSMutableArray array];
    for (int i = 0; i < 5; ++i) {
        
        CGFloat margin = 5 * (i + 1 );
        CGRect rect =CGRectMake(20 + 4 + 16 * i + margin,levelY , levelW, levelW);
        NSValue *value =  [NSValue valueWithCGRect:rect];
        [levelTempArr addObject:value];
    }
    self.leverlFArr = levelTempArr.copy;
    
    
    
    //获取字的高度
    CGSize detailSize = [self sizeWithText:model.detail textFont:FYSetFont(15) MaxSize:CGSizeMake(kScreenW - 40, MAXFLOAT)];
    self.detailF = CGRectMake(20, CGRectGetMaxY(self.commentLevelF) + 10 ,detailSize.width , detailSize.height);
    
    
    if (model.imageArr.count > 3 ) {
        self.imageF = CGRectMake(0, CGRectGetMaxY(self.detailF) + 10 * KadapterH, kScreenW, 250 * KadapterH);
    }else{
        if (model.imageArr.count == 0) {
            self.imageF = CGRectMake(0, CGRectGetMaxY(self.detailF) + 10 *KadapterH, 0, 0);
        }else{
            self.imageF = CGRectMake(0, CGRectGetMaxY(self.detailF) + 10 * KadapterH, kScreenW, 120 * KadapterH);

        }
    }
    //图片的布局
    NSMutableArray *imageTempArr = [NSMutableArray array];
    
    int column = 3;
    
    CGFloat viewHeight = 120 * KadapterH;
    
    CGFloat viewWidth = 100 * KadapterW;
    
    CGFloat margin = 10 * KadapterH;
    for (int i = 0; i < model.imageArr.count; ++i) {
        
        // 计算行索引, 和列索引
        int columnIndex = i % column;
        int rowIndex = i / column;
        
        // 计算x 和y的值
        CGFloat viewX = (kScreenW - 3 * viewWidth - 20 *KadapterW) * 0.5 + columnIndex * viewWidth + columnIndex * margin;
        
        //
        CGFloat viewY = (rowIndex ) * margin + rowIndex * viewHeight + CGRectGetMaxY(self.detailF) + 10 * KadapterH ;
     
        CGRect rect = CGRectMake(viewX, viewY , viewWidth, viewHeight);
        
        NSValue *value =  [NSValue valueWithCGRect:rect];
        
        [imageTempArr addObject:value];
        
    }
    
    self.imageFArr = imageTempArr.copy;
    //cell的高度
    _heightF = MAX(CGRectGetMaxY(self.detailF), CGRectGetMaxY(self.imageF)) + 10 *KadapterH;
}
/**
 *  计算文字的尺寸
 *
 *  @param text    需要计算的文字
 *  @param font    文字的字体
 *  @param maxSize 给定的文字范围
 *
 *  @return 文字计算后的真实尺寸
 */
- (CGSize)sizeWithText:(NSString *)text textFont:(UIFont *)font MaxSize:(CGSize)maxSize {
    // 字典中装得是表示一个字体
    NSDictionary *attr = @{NSFontAttributeName : font};
    return [text boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
    
    
}
@end
