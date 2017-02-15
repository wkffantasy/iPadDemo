//
//  MyStudyPlanController.m
//  ipadTest
//
//  Created by fantasy on 17/2/14.
//  Copyright © 2017年 fantasy. All rights reserved.
//

#import "MyStudyPlanController.h"

//view
#import "HeaderSelectView.h"

//lib
#import "Masonry.h"

@interface MyStudyPlanController ()

@property (weak, nonatomic) HeaderSelectView * selectView;

@end

@implementation MyStudyPlanController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  [self setupViews];
  
}

- (void)setupViews {
  
  NSArray * titleArray = @[
                           @"全部(54)",
                           @"学习中(1)",
                           @"未开始(1)",
                           @"已过期(54)",
                           ];
  @weakify(self);
  HeaderSelectView * selectView = [[HeaderSelectView alloc]initWithTitleArray:titleArray andSeletedColor:RGBCOLOR(74, 153, 255) andNormalColor:RGBCOLOR(134, 134, 134) andClickBlock:^(int tag) {
    
    @strongify(self);
    [self clickSelectViewBlock:tag];
    
  }];
//  selectView.backgroundColor = [UIColor redColor];
  [self.view addSubview:selectView];
  _selectView = selectView;
  [selectView mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.top.and.left.and.right.mas_equalTo(0);
    make.height.mas_equalTo(40);
    
  }];
  
}
- (void)clickSelectViewBlock:(int)tag {
  
  NSLog(@"clickSelectViewBlock tag == %d",tag);
  
}


@end
