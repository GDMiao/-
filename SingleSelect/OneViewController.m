//
//  OneViewController.m
//  SingleSelect
//
//  Created by 苗国栋 on 2017/4/26.
//  Copyright © 2017年 MiaoGuodong. All rights reserved.
//

#import "OneViewController.h"
#import "SelectCell.h"
@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource,SelectCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger *selectInteger;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    // Do any additional setup after loading the view.
}
- (void)initTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    _tableView = tableView;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cellIdentifier";
    SelectCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"SelectCell" owner:nil options:nil];
        cell = [cellArray lastObject];
    }
    
    [cell setCellData:[NSString stringWithFormat:@"cell ++ %ld",indexPath.row]];
    cell.delegate = self;
    cell.isSingleSelect = YES;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击 %ld",indexPath.row);
    // 单选 在 SelectCell.m - setSelected:(BOOL)selected animated:(BOOL)animated
    // 方法中做的 点击 selected 判断 做显示 隐藏

}


/**
 SelectCell Delegate 方法 可以传值到 SelectCell.m

 @return integer
 */
- (NSInteger)selectAction
{
    return self.selectInteger;
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
