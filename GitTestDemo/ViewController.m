//
//  ViewController.m
//  GitTestDemo
//
//  Created by wxj on 2019/4/3.
//  Copyright © 2019年 zkml－wxj. All rights reserved.
//

#import "ViewController.h"
#import "FDanmakuView.h"
#import "FDanmakuModel.h"

#define kSelfWidth [UIScreen mainScreen].bounds.size.width
#define kSelfHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<FDanmakuViewProtocol>
@property(nonatomic,weak)FDanmakuView *danmakuView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self createView];
}

- (void)createView{
    //弹幕显示区域
    FDanmakuView *danmaView = [[FDanmakuView alloc]initWithFrame:CGRectMake(0, 64, kSelfWidth, kSelfHeight-64-100)];
    danmaView.backgroundColor = [UIColor orangeColor];
    danmaView.delegate = self;
    self.danmakuView = danmaView;
    [self.view addSubview:danmaView];
    
    NSArray *btnArray = @[@"开始",@"暂停",@"继续"];
    CGFloat btnWidth = (kSelfWidth-20-40-40-20)/3;
    for (int i = 0; i<btnArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(20+i%3*(btnWidth+40), CGRectGetMaxY(danmaView.frame)+(100-40)*0.5, btnWidth, 40);
        btn.tag = i+1;
        [btn setTitle:btnArray[i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)sender {
    if (sender.tag == 1) { //开始
        FDanmakuModel *model1 = [[FDanmakuModel alloc]init];
        model1.beginTime = 3;
        model1.liveTime = 5;
        model1.content = @"哈哈哈~😊🙂😎~~~";
        
        FDanmakuModel *model2 = [[FDanmakuModel alloc]init];
        model2.beginTime = 3.2;
        model2.liveTime = 8;
        model2.content = @"23322333";
        
        [self.danmakuView.modelsArr addObject:model1];
        [self.danmakuView.modelsArr addObject:model2];
    }else if (sender.tag == 2){//暂停
        [self.danmakuView pause];
    }else{                     //继续
        [self.danmakuView resume];
    }
}

- (NSTimeInterval)currentTime {
    static double time = 0;
    time += 0.1 ;
    return time;
}

- (UIView *)danmakuViewWithModel:(FDanmakuModel*)model {
    UILabel *label = [UILabel new];
    label.text = model.content;
    [label sizeToFit];
    return label;
}

#pragma mark ********【操作】********单击某条弹幕
- (void)danmuViewDidClick:(UIView *)danmuView at:(CGPoint)point {
    NSLog(@"%@ %@",danmuView,NSStringFromCGPoint(point));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
