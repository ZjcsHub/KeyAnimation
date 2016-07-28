//
//  CATrasition.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CATrasition.h"

@interface CATrasition ()
@property (nonatomic,strong) UIImageView * imageView;

@property (nonatomic,strong) NSArray * imageArr;

@property (nonatomic,assign) NSInteger index;
@end

@implementation CATrasition

-(NSArray *)imageArr{
    if (!_imageArr) {
        _imageArr =@[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg"];
    }
    return _imageArr;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView =[[UIImageView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 300)];
        _imageView.image =[UIImage imageNamed:self.imageArr[4]];
    }
    return _imageView;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (_index==self.imageArr.count) {
        _index =0;
    }
    CATransition * animation =[CATransition animation];
    self.imageView.image =[UIImage imageNamed:self.imageArr[_index]];
    animation.type =@"push";
    animation.subtype =@"fromTop";
    animation.duration =1;
    [self.imageView.layer addAnimation:animation forKey:nil];
    _index ++;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.imageView];

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
