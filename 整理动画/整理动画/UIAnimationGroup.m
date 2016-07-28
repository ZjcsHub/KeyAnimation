//
//  UIAnimationGroup.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "UIAnimationGroup.h"

@interface UIAnimationGroup ()
@property (nonatomic,strong) UIView * moveView;
@end

@implementation UIAnimationGroup


-(UIView *)moveView{
    if (!_moveView) {
        _moveView =[[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _moveView.backgroundColor =[UIColor blueColor];
    }
    return _moveView;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation * basic1 =[CABasicAnimation animation];
    basic1.keyPath =@"transform.scale";
    basic1.toValue =@(2);

    basic1.duration =0.5;

    basic1.fillMode =kCAFillModeForwards;

    basic1.removedOnCompletion = NO;

    CABasicAnimation * basic2 =[CABasicAnimation animation];

    basic2.keyPath =@"transform.rotation";

    basic2.toValue =@(M_PI);

    basic2.duration =0.5;
    //动画开启的时间
    basic2.beginTime =0.5;

    CAAnimationGroup * group =[CAAnimationGroup animation];

    group.animations =@[basic1,basic2];

    group.fillMode =kCAFillModeForwards;

    group.removedOnCompletion = NO;

    group.duration =1;

    [self.moveView.layer addAnimation:group forKey:nil];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.moveView];

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
