//
//  CAFramAnimation1.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "CAFramAnimation1.h"

@interface CAFramAnimation1 ()
@property (weak, nonatomic) IBOutlet UITextField *textFile;

@end

@implementation CAFramAnimation1
- (IBAction)LoginAction:(id)sender {
    if ([self.textFile.text isEqualToString:@"123"]) {
        NSLog(@"登录成功");
    }else{
        CAKeyframeAnimation * keyAn =[CAKeyframeAnimation animation];
        keyAn.keyPath =@"position.x";

        //设置关键帧的位置
        keyAn.values = @[@0,@20,@-20,@20,@0];

        //设置关键帧的时间
        keyAn.keyTimes = @[@0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
        //设置时间
        keyAn.duration =0.5;
        //取得当前位置,根据当前位置设置
        keyAn.additive =YES;
        [self.textFile.layer addAnimation:keyAn forKey:nil];
        

    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
