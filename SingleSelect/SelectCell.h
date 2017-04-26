//
//  SelectCell.h
//  SingleSelect
//
//  Created by 苗国栋 on 2017/4/26.
//  Copyright © 2017年 MiaoGuodong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SelectCellDelegate <NSObject>

- (NSInteger)selectAction;

@end

@interface SelectCell : UITableViewCell
@property (nonatomic, strong) NSMutableArray *selectArray;
@property (nonatomic, weak) id<SelectCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UIImageView *seletedImg;
@property (nonatomic, assign) BOOL isSingleSelect;

- (void)setCellData:(NSString *)str;
- (void)multiSelectCellAtIndex:(NSInteger)index;
@end
