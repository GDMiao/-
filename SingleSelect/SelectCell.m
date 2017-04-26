//
//  SelectCell.m
//  SingleSelect
//
//  Created by 苗国栋 on 2017/4/26.
//  Copyright © 2017年 MiaoGuodong. All rights reserved.
//

#import "SelectCell.h"

@interface SelectCell ()
@property (nonatomic, strong) UIImage *selectImage;
@property (nonatomic, strong) UIImage *invertImage;

@end

@implementation SelectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _selectImage = [UIImage imageNamed:@"对勾"];
    _invertImage = [UIImage imageNamed:@""];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _isSingleSelect = NO;
}

- (void)setCellData:(NSString *)str
{
    if (!str) {
        self.name.text = @"空";
    }else{
        self.name.text = str;
    }
    self.seletedImg.image = _selectImage;
    self.seletedImg.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state

    // 单选
    if (!_isSingleSelect) {
        //
    }else{
        [self singleSelectCell:selected];
    }
}

- (void)singleSelectCell:(BOOL)selected
{
     //单选，判断 是否点击 做隐藏
    if (!selected) {
        self.seletedImg.hidden = YES;
    }else
    {
        self.seletedImg.hidden = NO;
        NSInteger selectInteger = [self.delegate selectAction];
        NSLog(@"slect___%ld",selectInteger);
    }
}

/**
 tableView 多选方法
 @param index
 
 多选方法要在 didSelectRowAtIndexPath 中使用；
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
 {
    // 获取当前位置的 cell
    SelectCell *selectCell = [tableView cellForRowAtIndexPath:indexPath];
    // 判断当前点击 row 在数组中是否重复  不重复添加 重复删除
    BOOL isHave = [selectCell.selectArray containsObject:[NSNumber numberWithInteger:indexPath.row]];
    if (!isHave) {
    [selectCell.selectArray addObject:[NSNumber numberWithInteger:indexPath.row]];
    }else{
    [selectCell.selectArray removeObject:[NSNumber numberWithInteger:indexPath.row]];
    }
    // 调用多选方法
    [selectCell multiSelectCellAtIndex:indexPath.row];
 }

 */
- (void)multiSelectCellAtIndex:(NSInteger)index
{
    // 判读储存数组中师傅包含 点击的元素 有则显示 无则隐藏
    BOOL selectBool = [self.selectArray containsObject:[NSNumber numberWithInteger:index]];
    if (!selectBool) {
        self.seletedImg.hidden = YES;
    }else{
        self.seletedImg.hidden = NO;
    }
}

- (NSMutableArray *)selectArray
{
    if (!_selectArray) {
        _selectArray = [NSMutableArray array];
    }
    return _selectArray;
}

@end
