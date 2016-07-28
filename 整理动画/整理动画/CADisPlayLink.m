//
//  CADisPlayLink.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CADisPlayLink.h"

@interface CADisPlayLink ()

@property (nonatomic, strong) CADisplayLink * link;

@end

@implementation CADisPlayLink

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor =[UIColor whiteColor];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"snowbg.jpg"];
    imageView.userInteractionEnabled = YES;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:imageView];


    //NSTime 定时器，用来计数，bannar,获取验证码
    //CADisplayLink 定时器，调用更频繁，用于动画，重绘

    CADisplayLink * link = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleAction)];

    //frameInterval = 1 ,每秒调用60次；
    //调用次数 = 60 / frameInterval
    link.frameInterval = 1;

    //将link放入runloop里
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];

    self.link = link;
}

- (void)handleAction {

    UIImage * snowImg  = [UIImage imageNamed:@"雪花"];
    UIImageView * snowView = [[UIImageView alloc] initWithImage:snowImg];
    //生成随机比例
    CGFloat scale = arc4random_uniform(40) / 100.0;
    //设置view的比例
    snowView.transform = CGAffineTransformMakeScale(scale, scale);
    //获取屏幕大小
    CGSize winSize = self.view.bounds.size;
    //随机获取x值
    CGFloat x = arc4random_uniform(winSize.width);
    CGFloat y = - snowView.frame.size.height * 0.5;

    //设置snow的起始坐标
    snowView.center = CGPointMake(x, y);

    [self.view addSubview:snowView];

    [UIView animateWithDuration:(arc4random_uniform(5)+ 5)animations:^{

        //雪花结束状态
        CGFloat toX = arc4random_uniform(winSize.width);
        CGFloat toY = winSize.height + snowView.frame.size.height * 0.5;
        snowView.center = CGPointMake(toX, toY);

        snowView.alpha = 0.3;

        //设置雪花旋转
        snowView.transform = CGAffineTransformRotate(snowView.transform, arc4random_uniform(M_PI));

    } completion:^(BOOL finished) {

        //雪花动画完成从父视图删除
        [snowView removeFromSuperview];

    }];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    //停止计时
    [self.link invalidate];
    self.link = nil;
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
