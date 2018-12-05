//
//  ZZAddressBookTableView.m
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import "ZZAddressBookTableView.h"
@interface ZZAddressBookTableView()<UITableViewDataSource,UITableViewDelegate>

@end
@implementation ZZAddressBookTableView
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    AddressDataModel * model = self.dataArray[indexPath.row];
    if (self.addressBookDelegate && [self.addressBookDelegate respondsToSelector:@selector(addModel:)]) {
        [self.addressBookDelegate addModel:model];
    }
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    if (self = [super initWithFrame:frame style:style]) {
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    AddressDataModel * model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.addressName;
    return cell;
}

@end
