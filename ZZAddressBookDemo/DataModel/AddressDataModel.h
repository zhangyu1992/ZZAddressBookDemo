//
//  AddressDataModel.h
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressDataModel : NSObject
@property (nonatomic, copy) NSString * level;
@property (nonatomic, copy) NSString * addressName;
@property (nonatomic, copy) NSString * addressId;
@property (nonatomic, copy) NSString * parentId;

@property (nonatomic, copy) NSArray <AddressDataModel *>*childArray;
@property (nonatomic, copy) NSArray <AddressDataModel *>*parentArray;

+ (NSMutableArray *)defalutModelArray;

@end

NS_ASSUME_NONNULL_END
