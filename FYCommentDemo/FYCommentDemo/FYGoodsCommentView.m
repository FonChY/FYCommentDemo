//
//  FYGoodsCommentView.m
//  PerfectBuyText
//
//  Created by FonChY on 16/8/10.
//  Copyright © 2016年 ChinaPan. All rights reserved.
//

#import "FYGoodsCommentView.h"

#import "FYGoodsCommentCell.h"
#import "FYGoodsCommentFrameModel.h"
#import "FYGoodsCommentModel.h"
#import "MJExtension.h"
#import "UIView+Extension.h"
@interface FYGoodsCommentView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, copy) NSMutableArray *dataArr;
@end


@implementation FYGoodsCommentView
- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setData];
        [self setTable];
    }
    return self;
}
- (void)setData{

    NSArray *arr = @[@{@"iconUrl":@"http://img4.imgtn.bdimg.com/it/u=2718132976,3419769724&fm=206&gp=0.jpg",@"name":@"士大夫撒旦法",@"memberLevel":@"1",@"time":@"2016-10-01  12:35",@"commentLevel":@"3",@"detail":@"就很深刻的回复就考虑到哈舒服是的啦分啦都是看见发送到饭卡的三句话刻录机符号立刻就恢复到埃里克手机号疯狂拉升疯狂拉升李开复哈迪斯了哈疯狂拉很深刻的回复就考虑到哈舒服是的啦分啦很深刻的回复就考虑到哈舒服是的啦分啦很深刻的回复就考虑到哈舒服是的啦分啦升发生了肯定会发克鲁斯奥斯卡了对asdfdsafadsfads方",@"imageArr":@[@"",@"",@"",@"",@""]},@{@"iconUrl":@"http://img4.imgtn.bdimg.com/it/u=2718132976,3419769724&fm=206&gp=0.jpg",@"name":@"士大夫撒旦法",@"memberLevel":@"2",@"time":@"2016-10-01  12:35",@"commentLevel":@"5",@"detail":@"就很深刻的回复就考虑到哈舒服是的啦分啦都是看见发送到饭卡的三句话刻录机符号立刻就恢复到埃里克手机号疯狂拉升疯狂拉升李开复哈迪斯了哈疯狂拉升发生了肯定会发克鲁斯奥斯卡了对方",@"imageArr":@[@"",@""]},@{@"iconUrl":@"http://img4.imgtn.bdimg.com/it/u=2718132976,3419769724&fm=206&gp=0.jpg",@"name":@"士大夫撒旦法",@"memberLevel":@"3",@"time":@"2016-10-01  12:35",@"commentLevel":@"1",@"detail":@"就很深刻的回复就考虑到哈舒服是的啦分啦都是看见发送到饭卡的三句话刻录机符号立刻就恢复到埃里克手机号疯狂拉升疯狂拉升李开复哈迪斯了哈疯狂拉升发生了肯定会拉升发生了肯定会发克鲁斯奥斯卡了拉升发生了肯定会发克鲁斯奥斯卡了拉升发生了肯定会发克鲁斯奥斯卡了发克鲁斯奥斯卡了对方",@"imageArr":@[]}];
    for (NSDictionary *dict in arr) {
        FYGoodsCommentFrameModel *frameModel = [[FYGoodsCommentFrameModel alloc] init];
        frameModel.model = [FYGoodsCommentModel mj_objectWithKeyValues:dict];
        
        [self.dataArr addObject:frameModel];
    }
   
    [self.mainTableView reloadData];
}
- (void)setTable{
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height) style:UITableViewStylePlain];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    [self addSubview:self.mainTableView];

 
  
   
}
#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    
    static NSString *ID = @"cell";
    
    FYGoodsCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //不建议用这个
//    FYGoodsCommentCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[FYGoodsCommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.frameModel = self.dataArr[indexPath.row];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    FYGoodsCommentFrameModel *frameModel = self.dataArr[indexPath.row];
    
    return frameModel.heightF;
}
@end
