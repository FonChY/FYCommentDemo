//
//  FYGoodsCommentCell.m
//  PerfectBuyText
//
//  Created by FonChY on 16/8/12.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import "FYGoodsCommentCell.h"
#import "FYGoodsCommentModel.h"
#import "UIImageView+WebCache.h"
#define FYSetFont(value)      [UIFont systemFontOfSize:value]
//获取图片资源
#define kGetImage(imageName) [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
#define UIColorFromValue(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@interface FYGoodsCommentCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *memberImageView;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UIView *levelView;
@property (nonatomic, strong) UIView *imageBgView;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, copy) NSMutableArray *levelImageViewArr;
@property (nonatomic, copy) NSMutableArray *imageArr;
@end
//字号对应上

@implementation FYGoodsCommentCell
- (NSMutableArray *)levelImageViewArr{
    if (!_levelImageViewArr) {
        _levelImageViewArr = [NSMutableArray array];
    }
    return _levelImageViewArr;
}

- (NSMutableArray *)imageArr{
    if (!_imageArr) {
        _imageArr = [NSMutableArray array];
    }
    return _imageArr;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView *iconImageView =[[UIImageView alloc] init];
        self.iconImageView = iconImageView;
        [self.contentView addSubview:iconImageView];
        
        UILabel *nameLabel = [[UILabel alloc] init];
        self.nameLabel = nameLabel;
        nameLabel.font = FYSetFont(13);
        [self.contentView addSubview:nameLabel];
        
        UIImageView *memberImageView =[[UIImageView alloc] init];
        self.memberImageView = memberImageView;
        [self.contentView addSubview:memberImageView];
        
        UILabel *timeLabel = [[UILabel alloc] init];
        self.timeLabel = timeLabel;
        timeLabel.font = FYSetFont(13);
        timeLabel.textColor = UIColorFromValue(0x999999);
        [self.contentView addSubview:timeLabel];
        
        UILabel *lineLabel = [[UILabel alloc] init];
        self.lineLabel = lineLabel;
        lineLabel.backgroundColor = RGBCOLOR(228, 227, 229);
        [self.contentView addSubview:lineLabel];
        
        UILabel *detailLabel = [[UILabel alloc] init];
        self.detailLabel = detailLabel;
        detailLabel.numberOfLines = 0;
        detailLabel.font = FYSetFont(15);
        [self.contentView addSubview:detailLabel];
        
        UIView *levelView = [[UIView alloc] init];
        self.levelView = levelView;
        [self.contentView addSubview:levelView];
        for (int i = 0; i < 5; ++i) {
            
            UIImageView *redLevelView = [[UIImageView alloc] init];
            [self.levelImageViewArr addObject:redLevelView];
            [self.contentView addSubview:redLevelView];
        }
        
        
        UIView *imageBgView = [[UIView alloc] init];
        self.imageBgView = imageBgView;
        [self.contentView addSubview:imageBgView];
        
   
        
    }
    return self;
}


- (void)setFrameModel:(FYGoodsCommentFrameModel *)frameModel{
    _frameModel = frameModel;
    FYGoodsCommentModel *model = frameModel.model;
    
    self.iconImageView.frame = frameModel.iconF;
    self.iconImageView.layer.cornerRadius = frameModel.iconF.size.width * 0.5;
    self.iconImageView.layer.masksToBounds = YES;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrl] placeholderImage:[UIImage imageNamed:@"defalt_head"]];

    
    self.nameLabel.frame = frameModel.nameF;
    self.nameLabel.text =model.name;
    
    
    self.timeLabel.frame = frameModel.timeF;
    self.timeLabel.text = model.time;
    
 
 
    self.memberImageView.frame = frameModel.memberLevelF;
//    self.memberImageView.backgroundColor = [UIColor redColor];
    if ([model.memberLevel isEqualToString:@"1"]) {
        self.memberImageView.image = [UIImage imageNamed:@"gold"];
    }else if ([model.memberLevel isEqualToString:@"2"]){
        self.memberImageView.image = [UIImage imageNamed:@"copper"];

    }else{
        self.memberImageView.image = [UIImage imageNamed:@"siliver"];

    }
    
    
    self.lineLabel.frame = frameModel.lineF;
    
    self.levelView.frame = frameModel.commentLevelF;
    //评价的星星数
    NSInteger levelnum = [model.commentLevel integerValue];
 
    NSArray *arr = frameModel.leverlFArr;
    
    for (int i = 0; i < self.levelImageViewArr.count; ++i) {
        UIImageView *levelImageView = self.levelImageViewArr[i];
        NSValue *value = arr[i];
        
        CGRect levelRect = value.CGRectValue;
        
        levelImageView.frame = levelRect;
        
//        levelImageView.centerY = self.levelView.centerY;
        
        if (i+1 <= levelnum) {
            levelImageView.image = kGetImage(@"star_red");
        }else{
        levelImageView.image = kGetImage(@"star_gray");
        }
    }
 
    
    self.detailLabel.frame = frameModel.detailF;
    self.detailLabel.text = model.detail;
    
    self.imageBgView.frame = frameModel.imageF;
    self.imageBgView.backgroundColor = [UIColor orangeColor];
    
    NSArray *imageFArr = frameModel.imageFArr;
    
    if (self.imageArr.count > 0) {
        
        for (UIImageView *commentImageView in self.imageArr) {
            [commentImageView removeFromSuperview];
        }
        [self.imageArr removeAllObjects];
    }
    for (int i = 0; i < model.imageArr.count; ++i) {
  
        NSValue *value = imageFArr[i];
        
        UIImageView *commentImageView = [[UIImageView alloc] init];
        commentImageView.frame = value.CGRectValue;
        
        [commentImageView sd_setImageWithURL:[NSURL URLWithString:model.imageArr[i]] placeholderImage:[UIImage imageNamed:@"default_img_big"]];
        [self.imageArr addObject:commentImageView];
        
        [self.contentView addSubview:commentImageView];
    }
    
}
@end
