//
//  ViewController.m
//  ipadTest
//
//  Created by fantasy on 17/2/13.
//  Copyright © 2017年 fantasy. All rights reserved.
//


//controller
#import "ViewController.h"
#import "MyHomeController.h"
#import "MyStudyPlanController.h"
#import "MyLiveController.h"
#import "MyExerciseController.h"
#import "MyModelExamController.h"
#import "MyCheckController.h"
#import "MyBrieflyTeachController.h"

//view
#import "LeftRootView.h"
#import "UserTopView.h"

//model


//lib and others
#import "Masonry.h"

@interface ViewController ()

@property (weak,nonatomic) UIView * containerView;
@property (assign, nonatomic) NSInteger currentTag;
@property (weak, nonatomic) UIView * currentView;
@property (strong, nonatomic) NSArray * viewsArray;
@property (strong, nonatomic) NSArray * titlesArray;
@property (weak, nonatomic) UILabel * titleLabel;

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
  _titlesArray = titleArray;
  NSAssert(self.titlesArray.count == self.viewsArray.count, @"");
  _currentTag = 0;
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
  
  UILabel * titleLabel = [UILabel new];
  titleLabel.textColor = RGBCOLOR(66, 66, 66);
  titleLabel.font = [UIFont systemFontOfSize:30];
  _titleLabel =titleLabel;
  [self.view addSubview:titleLabel];
  
  [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.top.mas_equalTo(topView.mas_bottom).offset(20);
    make.left.mas_equalTo(leftView.mas_right).offset(20);
    
  }];
  
  
  UIView * containerView = [UIView new];
  _containerView = containerView;
  [self.view addSubview:containerView];
  [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.updateExisting = YES;
    make.top.mas_equalTo(titleLabel.mas_bottom).offset(20);
    make.left.mas_equalTo(leftView.mas_right).offset(20);
    make.right.mas_equalTo(-20);
    make.bottom.mas_equalTo(0);
  }];
  
  [self didSelectLeftButtons:0];
  
  
}



- (void)didSelectLeftButtons:(NSInteger)tag {
  
  _currentTag = tag;

  NSLog(@"didSelectLeftButtons tag== %ld",(long)tag);
  [self changeCurrentViewAndTitle];
  
  
}
- (void)changeCurrentViewAndTitle {
  
  if (self.currentView) {
    [self.currentView removeFromSuperview];
  }
  NSString * currentTitle = self.titlesArray[self.currentTag];
  self.titleLabel.text = currentTitle;
  
  self.currentView = self.viewsArray[self.currentTag];
  [self.containerView addSubview:self.currentView];
  [self.currentView mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.top.and.left.and.right.and.bottom.mas_equalTo(0);
    
  }];
  
  
}


- (NSArray *)viewsArray {
  
  if (_viewsArray == nil) {
    
    MyHomeController * homeVC = [MyHomeController new];
    MyStudyPlanController * spVC = [MyStudyPlanController new];
    MyLiveController * mlVC = [MyLiveController new];
    MyExerciseController * meVC = [MyExerciseController new];
    MyModelExamController * mmeVC = [MyModelExamController new];
    MyCheckController * mccVC = [MyCheckController new];
    MyBrieflyTeachController *mbtVC = [MyBrieflyTeachController new];
    
    _viewsArray = @[
                    homeVC.view,
                    spVC.view,
                    mlVC.view,
                    meVC.view,
                    mmeVC.view,
                    mccVC.view,
                    mbtVC.view,
                    ];
  }
  return _viewsArray;
  
}


@end
