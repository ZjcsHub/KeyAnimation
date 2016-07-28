//
//  CALayerMaodian.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CALayerMaodian.h"

@interface CALayerMaodian ()
@property (nonatomic,strong) UIImageView * imageView;
@end

@implementation CALayerMaodian

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView =[[UIImageView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
        _imageView.image =[UIImage imageNamed:@"1-1"];
        //锚点默认为视图中心（0.5，0.5）这里更改默认锚点值
        _imageView.layer.anchorPoint =CGPointMake(0, 0);
    }
    return _imageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.imageView];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.5 animations:^{
//        self.imageView.layer.transform =CATransform3DMakeRotation(M_PI_2, 0, 0, 1);
        self.imageView.transform =CGAffineTransformRotate(self.imageView.transform, M_PI_2);
    } completion:^(BOOL finished) {
        
    }];
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
