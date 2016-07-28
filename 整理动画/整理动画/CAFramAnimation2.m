//
//  CAFramAnimation2.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CAFramAnimation2.h"

@interface CAFramAnimation2 ()
@property (nonatomic,strong) UIView * moveView;
@property (nonatomic,assign) BOOL isAnimation;
@end

@implementation CAFramAnimation2

-(UIView *)moveView{
    if (!_moveView) {
        _moveView =[[UIView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
        _moveView.backgroundColor =[UIColor redColor];
    }
    return _moveView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.moveView];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if(!self.isAnimation){
        NSLog(@"kaishi");
        NSLog(@"%d",self.isAnimation);
        CAKeyframeAnimation * keyAn =[CAKeyframeAnimation animation];
        keyAn.keyPath =@"position";
        CGRect boundPath = CGRectMake(self.view.center.x-150, self.view.center.y-150,300, 300);
        keyAn.path =CFAutorelease(CGPathCreateWithEllipseInRect(boundPath, NULL));
        keyAn.duration =2;
        keyAn.repeatCount =HUGE_VALF;//无穷大
        //设置恒定加速度
        keyAn.calculationMode =kCAAnimationPaced;
        //设置转动模式
        keyAn.rotationMode =kCAAnimationRotateAuto;
        [self.moveView.layer addAnimation:keyAn forKey:@"key"];

    }else{
        [self.moveView.layer removeAllAnimations];
        NSLog(@"tingzhi");
    }
    self.isAnimation =!self.isAnimation;

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
