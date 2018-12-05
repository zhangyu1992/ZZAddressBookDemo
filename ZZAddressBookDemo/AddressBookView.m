//
//  AddressBookView.m
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import "AddressBookView.h"
#import "ZZAddressBookTableView.h"
#import "ZZAddressSelectedView.h"

@interface AddressBookView()<ZZAddressBookTableViewDelegate,ZZAddressSelectedViewDelegate>
@property (nonatomic, strong) ZZAddressBookTableView * addressTableview;
@property (nonatomic, strong) ZZAddressSelectedView * selectedView;

@end

@implementation AddressBookView
- (instancetype)init{
    if (self = [super init]) {
        [self creatUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}
#pragma mark -- add
- (void)addModel:(AddressDataModel *)model{
    
//    model.parentArray = [self.addressTableview.dataArray mutableCopy];
    
    self.addressTableview.dataArray = [model.childArray mutableCopy];;
    [self.addressTableview reloadData];
    
    [self.selectedView.dataArray addObject:model];
    [self.selectedView reloadData];
}
#pragma mark -- deleted
- (void)deletedModel:(AddressDataModel *)model{
    
    NSInteger level = [model.level integerValue];
    
    if (level == self.selectedView.dataArray.count-1) {
        return ;// 最后一个不能点
    }
    
    for (AddressDataModel * dataModel in [self.selectedView.dataArray mutableCopy]) {
        NSInteger modelLevel = [dataModel.level integerValue];
        if (modelLevel > level) {
            [self.selectedView.dataArray removeObject:dataModel];
        }
    }
    [self.selectedView reloadData];
    
    self.addressTableview.dataArray = [model.childArray mutableCopy];;
    [self.addressTableview reloadData];
    
}
#pragma mark -- 默认值
- (void)reloadDataWithtTitleArray:(NSMutableArray *)titleArray AddressArray:(NSMutableArray *)addressArray{
    
    self.addressTableview.dataArray = [addressArray mutableCopy];;
    [self.addressTableview reloadData];
    
    self.selectedView.dataArray = [titleArray mutableCopy];
    [self.selectedView reloadData];
    
}

- (void)creatUI{
    self.addressTableview = [[ZZAddressBookTableView alloc]initWithFrame:CGRectMake(0, 60, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    self.addressTableview.addressBookDelegate = self;
    [self addSubview:self.addressTableview];
    
    self.selectedView = [[ZZAddressSelectedView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 50)];
    self.selectedView.seletedDelegate = self;
    [self addSubview:self.selectedView];
}
@end
