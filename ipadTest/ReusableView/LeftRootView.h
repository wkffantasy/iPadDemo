//
//  LeftRootView.h
//  ipadTest
//
//  Created by fantasy on 17/2/13.
//  Copyright © 2017年 fantasy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickTitleBlock)(NSInteger tag);

@interface LeftRootView : UIView

- (instancetype)initWithTitlesArray:(NSArray <NSString *>*)titleArray
                      andClickEvent:(ClickTitleBlock)clickBlock;

@end
