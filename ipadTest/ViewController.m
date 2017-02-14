//
//  ViewController.m
//  ipadTest
//
//  Created by fantasy on 17/2/13.
//  Copyright © 2017年 fantasy. All rights reserved.
//


//controller
#import "ViewController.h"


//view
#import "LeftRootView.h"
#import "UserTopView.h"

//model


//lib and others
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  
  [self setupViews];
}
- (void)setupViews {
  
  UserTopView * topView = [[UserTopView alloc]init];
  [self.view addSubview:topView];
  [topView mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.top.and.left.and.right.mas_equalTo(0);
    make.height.mas_equalTo(200);
    
  }];
  
  NSArray * titleArray = @[
                      @"我的首页",
                      @"我的学习计划",
                      @"我的直播",
                      @"我的联系",
                      @"我的模考",
                      @"我的批改",
                      @"我的逐题精讲",
                      ];
  @weakify(self);
  LeftRootView * leftView = [[LeftRootView alloc]initWithTitlesArray:titleArray andClickEvent:^(NSInteger tag) {
    
    @strongify(self);
    [self didSelectLeftButtons:tag];
    
  }];
  [self.view addSubview:leftView];
  [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.left.mas_equalTo(20);
    make.top.mas_equalTo(topView.mas_bottom).offset(20);
    make.width.mas_equalTo(170);
    
  }];
  
}
- (void)didSelectLeftButtons:(NSInteger)tag {
  
  NSLog(@"didSelectLeftButtons tag== %ld",(long)tag);
  
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}


@end
