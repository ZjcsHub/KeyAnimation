//
//  CALayerDisappearAnimation.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CALayerDisappearAnimation.h"

@interface CALayerDisappearAnimation ()
@property (nonatomic,strong) CALayer * layer;
@end

@implementation CALayerDisappearAnimation

-(CALayer *)layer{
    if (!_layer) {
        _layer =[CALayer layer];
        _layer.frame =CGRectMake(100, 200, 100, 100);
        _layer.backgroundColor =[UIColor orangeColor].CGColor;
    }
    return _layer;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view.layer addSublayer:self.layer];

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.layer.transform =CATransform3DMakeTranslation(arc4random_uniform(200), arc4random_uniform(200), 0);
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
