//
//  MyHomeController.m
//  ipadTest
//
//  Created by fantasy on 17/2/14.
//  Copyright © 2017年 fantasy. All rights reserved.
//

#import "MyHomeController.h"

//view


//lib
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>


#import "Masonry.h"

@interface MyHomeController ()

@end

@implementation MyHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
  
  NSURL *jsCodeLocation;
#ifdef DEBUG
//  jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil];
  NSString * strUrl = @"http://localHost:8081/index.ios.bundle?platform=ios&dev=true";
  jsCodeLocation = [NSURL URLWithString:strUrl];
#else
  jsCodeLocation = [CodePush bundleURL];
#endif
  
  NSArray *imageList = @[@"http://foo.com/bar1.png",
                         @"http://foo.com/bar2.png"];
  
  NSDictionary *props = @{@"images" : imageList};

  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"ipadTest"
                                               initialProperties:nil
                                                   launchOptions:props];
  
  rootView.backgroundColor = RandomColor;
  rootView.frame = CGRectMake(0, 0, 100, 100);
  [self.view addSubview:rootView];
  
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
