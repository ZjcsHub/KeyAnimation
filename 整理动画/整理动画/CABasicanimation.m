//
//  CABasicanimation.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CABasicanimation.h"

@interface CABasicanimation ()
@property (nonatomic,strong) UIView * moveView;
@end

@implementation CABasicanimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor =[UIColor whiteColor];
    self.moveView =[[UIView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    self.moveView.backgroundColor =[UIColor cyanColor];
    [self.view addSubview:self.moveView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation * basic =[CABasicAnimation animation];
    //设置路径
    basic.keyPath = @"position.x";

    //设置起始点
    //    basic.fromValue =[NSValue valueWithCGPoint:CGPointMake(50, 50)];
    //    //设置终点
    //    basic.toValue = [NSValue valueWithCGPoint:CGPointMake(250, 250)];

    //设置距离
    basic.byValue = @(100);

    //保留当前的状态
//    basic.fillMode = kCAFillModeForwards;//@"forwards";
//    basic.removedOnCompletion = NO;

    //动画时间
    basic.duration = 2;

    //某一时刻的速度
    basic.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//@"easeIn"];

    //    basic.timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.2 :0.5 :0.1 :0.2];

    [self.moveView.layer addAnimation:basic forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
