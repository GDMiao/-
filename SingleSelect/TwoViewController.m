//
//  TwoViewController.m
//  SingleSelect
//
//  Created by 苗国栋 on 2017/4/26.
//  Copyright © 2017年 MiaoGuodong. All rights reserved.
//

#import "TwoViewController.h"
#import "SelectCell.h"
@interface TwoViewController ()<UITableViewDelegate,UITableViewDataSource,SelectCellDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) NSInteger *selectInteger;
@end

@implementation TwoViewController

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
//    cell.isSingleSelect = NO; // 多选时 单选默认 No
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 多选调用方式
    SelectCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    // 判断数组中是否存在重复元素
    BOOL isHave = [selectCell.selectArray containsObject:[NSNumber numberWithInteger:indexPath.row]];
    if (!isHave) {
        [selectCell.selectArray addObject:[NSNumber numberWithInteger:indexPath.row]];
    }else{
        [selectCell.selectArray removeObject:[NSNumber numberWithInteger:indexPath.row]];
    }
    // 调用多选显示方法
    [selectCell multiSelectCellAtIndex:indexPath.row];
}


/**
 SelectCell Delegate 方法
 
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
