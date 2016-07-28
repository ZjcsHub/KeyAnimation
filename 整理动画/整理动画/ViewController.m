//
//  ViewController.m
//  整理动画
//
//  Created by ma c on 16/7/19.
//  Copyright © 2016年 bjsxt. All rights reserved.
//

#import "ViewController.h"
#import "UIAnimationGroup.h"
#import "CALayerDisappearAnimation.h"
#import "CALayerMaodian.h"
#import "CALayerLei.h"
#import "CAFramAnimation1.h"
#import "CAFramAnimation2.h"
#import "CABasicanimation.h"
#import "CATrasition.h"
#import "LongParss.h"
#import "CADisPlayLink.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSArray * dataList;
@property (nonatomic,strong) NSArray * controllerName;
@end

@implementation ViewController

-(NSArray *)controllerName{
    if (!_controllerName) {
        _controllerName =@[@"LongParss",@"CATrasition",@"CABasicanimation",@"CADisPlayLink",@"CAFramAnimation1",@"CAFramAnimation2",@"CALayerLei",@"CALayerMaodian",@"CALayerDisappearAnimation",@"UIAnimationGroup"];
    }
    return _controllerName;
}

-(NSArray *)dataList{
    if (!_dataList) {
        _dataList =@[@"长按抖动",@"转场动画CATrasition",@"CABasicAnimation",@"CADisPlayLink定时器",@"CAFramAnimation1",@"CAFramAnimation2",@"CALayer",@"CALayer锚点",@"CALayer隐式动画",@"UIAnimationGroup"];
    }
    return _dataList;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * idenfider =@"cell";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:idenfider];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idenfider];
    }
    cell.textLabel.text =self.dataList[indexPath.row];
    return cell;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView =[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.dataSource =self;
        _tableView.delegate =self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"动画类型";
    [self.view addSubview:self.tableView];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController * viewController =[[NSClassFromString(self.controllerName[indexPath.row]) alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
