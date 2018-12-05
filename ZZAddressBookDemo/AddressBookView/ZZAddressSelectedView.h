//
//  ZZAddressSelectedView.h
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressDataModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ZZAddressSelectedViewDelegate <NSObject>

- (void)deletedModel:(AddressDataModel *)model;

@end

@interface ZZAddressSelectedView : UIView
@property (nonatomic, strong) NSMutableArray * dataArray;
- (void)reloadData;
@property (nonatomic, weak) id <ZZAddressSelectedViewDelegate>seletedDelegate;
@end

NS_ASSUME_NONNULL_END
