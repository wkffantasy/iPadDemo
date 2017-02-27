//
//  LeftRootView.m
//  ipadTest
//
//  Created by fantasy on 17/2/13.
//  Copyright © 2017年 fantasy. All rights reserved.
//

//view
#import "LeftRootView.h"

//model

//lib or others
#import "Masonry.h"

//defined
#define selectedBackgroundColor  RGBCOLOR(74, 153, 255)
#define normalBackgroundColor    RGBCOLOR(243, 246, 251)

#define selectedTextColor        RGBCOLOR(243, 243, 243)
#define normalTextColor          RGBCOLOR(33, 33, 33)

#define buttonH   50

@interface LeftRootView ()

@property (copy, nonatomic) ClickTitleBlock clickBlock;
@property (strong, nonatomic) NSArray  * titleArray;
@property (weak, nonatomic)   UIButton * selectButton;

@end

@implementation LeftRootView

- (instancetype)initWithTitlesArray:(NSArray<NSString *> *)titleArray andClickEvent:(ClickTitleBlock)clickBlock {

  if (self = [super init]) {
    NSAssert(titleArray.count > 0, @"");
    _titleArray = titleArray;
    _clickBlock = clickBlock;
    [self setupView];
  }
  return self;
  
}
- (void)setupView {
  
  //fixme: 小于
  for (int i=0; i<self.titleArray.count; i++) {
    
    NSString * buttonTitle = self.titleArray[i];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:buttonTitle forState:UIControlStateNormal];
    [button setTitleColor:normalTextColor forState:UIControlStateNormal];
    button.backgroundColor =normalBackgroundColor;
    button.tag = i;
    [self addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
      
      make.updateExisting = YES;
      make.left.and.right.mas_equalTo(0);
      make.top.mas_equalTo(i*buttonH);
      make.height.mas_equalTo(buttonH);
      if (i==self.titleArray.count-1) {
        make.bottom.mas_equalTo(self.mas_bottom);
      }
      
    }];
    
    if (i==0) {
      _selectButton = button;
      [_selectButton setTitleColor:selectedTextColor forState:UIControlStateNormal];
      _selectButton.backgroundColor = selectedBackgroundColor;
    }
    
    //add white line if not the last
    if (i != self.titleArray.count - 1 ) {
      UIView * whiteView = [UIView new];
      whiteView.backgroundColor = [UIColor whiteColor];
      [button addSubview:whiteView];
      [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.updateExisting = YES;
        make.left.and.right.and.bottom.mas_equalTo(0);
        make.height.mas_equalTo(2);
      }];
    }
    
  }
  
  UIView * lineView = [UIView new];
  lineView.backgroundColor = selectedBackgroundColor;
  [self addSubview:lineView];
  [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.left.and.top.and.bottom.mas_equalTo(0);
    make.width.mas_equalTo(2);
    
  }];
  
}
- (void)clickButton:(UIButton *)button {
  
  if (button == _selectButton) {
    return;
  }
  [_selectButton setTitleColor:normalTextColor forState:UIControlStateNormal];
  _selectButton.backgroundColor = normalBackgroundColor;
  
  _selectButton = button;
  [button setTitleColor:selectedTextColor forState:UIControlStateNormal];
  _selectButton.backgroundColor = selectedBackgroundColor;
  if (self.clickBlock) {
    self.clickBlock(button.tag);
  }
  
}


@end
