//
//  UserTopView.m
//  ipadTest
//
//  Created by fantasy on 17/2/13.
//  Copyright © 2017年 fantasy. All rights reserved.
//

//view
#import "UserTopView.h"


//mode


//lib or others
#import "Masonry.h"

//defines
#define iconWhiteWH 80


@interface UserTopView ()



@end

@implementation UserTopView

- (instancetype)initWithFrame:(CGRect)frame {
  
  if (self = [super initWithFrame:frame]) {
    
    self.backgroundColor = RGBCOLOR(69, 81, 138);
    [self setupViews];
  }
  return self;
  
}

- (void)setupViews {
  
  UIImageView * iconWhiteView = [[UIImageView alloc]init];
  iconWhiteView.backgroundColor = [UIColor whiteColor];
  iconWhiteView.layer.masksToBounds = YES;
  iconWhiteView.layer.borderColor = [UIColor whiteColor].CGColor;
  iconWhiteView.layer.borderWidth = 3.;
  iconWhiteView.layer.cornerRadius =iconWhiteWH/2.;
  iconWhiteView.image = [UIImage imageNamed:@"dog"];
  [self addSubview:iconWhiteView];
  
  NSString * name = @"姬如雪";
  UILabel * nameLabel = [[UILabel alloc]init];
  nameLabel.textColor = [UIColor whiteColor];
  nameLabel.font = [UIFont systemFontOfSize:18];
  nameLabel.text = [NSString stringWithFormat:@"%@,下午好\n今天的学习任务你完成了吗？",name];
  nameLabel.numberOfLines = 0;
  
  [self addSubview:nameLabel];
  
  
  [iconWhiteView mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.left.mas_equalTo(100);
    make.width.and.height.mas_equalTo(iconWhiteWH);
    make.centerY.mas_equalTo(self.mas_centerY);
    
  }];
  
  [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    
    make.updateExisting = YES;
    make.left.mas_equalTo(iconWhiteView.mas_right).offset(20);
    make.centerY.mas_equalTo(self.mas_centerY);
    
  }];
  
  
}


@end
