//
//  ViewController.m
//  GitTestDemo
//
//  Created by 王雪剑 on 2019/4/3.
//  Copyright © 2019年 zkml－wxj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createUI];
}

- (void)createUI{
    NSLog(@"111");
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
