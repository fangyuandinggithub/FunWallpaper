//
//  MoreViewController.m
//  ViewStock
//
//  Created by SayHi on 2019/1/22.
//  Copyright © 2019年 ViewStock. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self resetNavi];
}

//修改导航栏
- (void)resetNavi{
    [self.navigationController.navigationBar setTranslucent:true];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}



@end
