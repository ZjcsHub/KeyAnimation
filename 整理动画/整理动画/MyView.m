//
//  MyView.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "MyView.h"


@interface MyView ()

@property (nonatomic, assign) IBInspectable CGFloat cornerRadius;

@property (nonatomic, assign) IBInspectable CGFloat lineWidth;

@property (nonatomic, strong) IBInspectable UIColor * lineColor;

@end

@implementation MyView

-(void)setCornerRadius:(CGFloat)cornerRadius{
    _cornerRadius =cornerRadius;
    self.layer.cornerRadius =cornerRadius;
    self.layer.masksToBounds =YES;
}

-(void)setLineWidth:(CGFloat)lineWidth{
    _lineWidth =lineWidth;
    self.layer.borderWidth =lineWidth;
}
-(void)setLineColor:(UIColor *)lineColor{
    _lineColor =lineColor;
    self.layer.borderColor =lineColor.CGColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
