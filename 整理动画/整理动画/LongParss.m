//
//  LongParss.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "LongParss.h"
#import "MyView.h"
@interface LongParss ()

@property (weak, nonatomic) IBOutlet MyView *BasicView;
@property (nonatomic,assign) BOOL isAnimation;
@end

@implementation LongParss

- (void)viewDidLoad {
    [super viewDidLoad];

    UILongPressGestureRecognizer * longP =[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(doAction:)];
    [self.BasicView addGestureRecognizer:longP];

}
-(void)doAction:(UILongPressGestureRecognizer*)longP{
    if(longP.state ==UIGestureRecognizerStateBegan){
    if (_isAnimation) {
        [self stopAnimation];
    }else{
        [self startAnimation];
    }
        _isAnimation =!_isAnimation;
    }
}
- (void)startAnimation {

    CGFloat angle = M_PI_4 * 0.3;

    CAKeyframeAnimation * keyframe = [CAKeyframeAnimation animation];

    keyframe.keyPath = @"transform.rotation";

    keyframe.values = @[@(-angle),@(angle),@(-angle)];

    keyframe.duration = 0.2;

    keyframe.repeatCount = MAXFLOAT;

    [self.BasicView.layer addAnimation:keyframe forKey:@"haha"];

}

- (void)stopAnimation {

    [self.BasicView.layer removeAnimationForKey:@"haha"];
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
