//
//  AddressDataModel.m
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import "AddressDataModel.h"
#import "YYKit.h"

@implementation AddressDataModel
+ (NSArray *)dataDict{
    return @[@{@"level":@"1",@"addressName":@"第一级 第一个",@"addressId":@"11",@"parentId":@"",@"childArray":@[
            @{@"level":@"2",@"addressName":@"第二级 第一个",@"addressId":@"11_21",@"parentId":@"11",@"childArray":@[
                                @{@"level":@"3",@"addressName":@"第三级 第一个",@"addressId":@"11_21_31",@"parentId":@"11_21",@"childArray":@[]}]},
            @{@"level":@"2",@"addressName":@"第二级 第二个",@"addressId":@"11_22",@"parentId":@"11",@"childArray":@[]
                         }]},
             @{@"level":@"1",@"addressName":@"第一级 第二个",@"addressId":@"12",@"parentId":@"",@"childArray":@[]},
             @{@"level":@"1",@"addressName":@"第一级 第三个",@"addressId":@"13",@"parentId":@"",@"childArray":@[]},
             @{@"level":@"1",@"addressName":@"第一级 第四个",@"addressId":@"14",@"parentId":@"",@"childArray":@[]}];
}
+ (NSMutableArray *)defalutModelArray{
    
    NSMutableArray * dataArray = [[NSMutableArray alloc]init];
    for (NSDictionary * dataDict in [self dataDict]) {
        AddressDataModel * model = [AddressDataModel modelWithDictionary:dataDict];
        [dataArray addObject:model];
    }
    return dataArray;
    
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"childArray" : [AddressDataModel class]
             };
}
@end
