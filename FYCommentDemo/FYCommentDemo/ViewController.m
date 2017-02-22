//
//  ViewController.m
//  FYCommentDemo
//
//  Created by FonChY on 2017/2/22.
//  Copyright © 2017年 FonChY. All rights reserved.
//

#import "ViewController.h"
#import "FYGoodsCommentView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FYGoodsCommentView *commentView = [[FYGoodsCommentView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:commentView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
