//
//  ViewController.m
//  MasonryDemoFromUU
//
//  Created by bsmac2 on 15/11/24.
//  Copyright © 2015年 bsmac2. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createView];
}

- (void)createView {
    
    UIView *leftView = [[UIView alloc]init];
    UILabel *rightLab = [[UILabel alloc]init];
    UIButton *corButton = [[UIButton alloc]init];
    
    leftView.backgroundColor = [UIColor blueColor];
    rightLab.backgroundColor = [UIColor yellowColor];
    corButton.backgroundColor = [UIColor redColor];
    corButton.layer.cornerRadius = 50;
    corButton.clipsToBounds = YES;
    
    [self.view addSubview:leftView];
    [self.view addSubview:rightLab];
    [self.view addSubview:corButton];
    
//    去除无关约束
    leftView.translatesAutoresizingMaskIntoConstraints = NO;
    rightLab.translatesAutoresizingMaskIntoConstraints = NO;
    corButton.translatesAutoresizingMaskIntoConstraints = NO;
    
//    想固定位置，必须确定自身宽高和上下左右四个方向的任意两个方向，（上，左）；（下，右）
    [leftView mas_updateConstraints:^(MASConstraintMaker *make) {
//        自身宽高
        make.size.mas_equalTo(CGSizeMake(100, 210));
//        自己左边的坐标在self.view最左边坐标再往右偏移30
        make.leading.equalTo(self.view.mas_leading).with.offset(30);
//        自己Y中心点是父视图的Y中心点
        make.centerY.equalTo(self.view);
    }];
    
    [rightLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
//        自己左边的坐标在leftView最右边坐标再往右偏移10
        make.leading.equalTo(leftView.mas_trailing).with.offset(10);
//        自己下边的坐标和leftView最下边坐标平齐
        make.bottom.equalTo(leftView.mas_bottom).with.offset(0);
    }];
    
    [corButton mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
//        自己左边的坐标在leftView最右边坐标再往右偏移10
        make.leading.equalTo(leftView.mas_trailing).with.offset(10);
//        自己下边的坐标在rightLab最上边坐标再往上偏移10
        make.bottom.equalTo(rightLab.mas_top).with.offset(-10);
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
