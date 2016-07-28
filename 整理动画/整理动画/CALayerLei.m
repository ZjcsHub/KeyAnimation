//
//  CALayerLei.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CALayerLei.h"

@interface CALayerLei ()
@property (nonatomic,strong) UIView * imageView;
@end

@implementation CALayerLei

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    UIImage * image =[UIImage imageNamed:@"1"];
    _imageView =[[UIView alloc ] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _imageView.layer.contents = (__bridge id _Nullable)(image.CGImage);
    //设置layer的transform
    [self.view addSubview:_imageView];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [UIView animateWithDuration:0.5 animations:^{
    self.imageView.layer.transform = CATransform3DMakeScale(2, 2, 2);
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
