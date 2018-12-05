//
//  ZZAddressBookTableView.h
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressDataModel.h"

NS_ASSUME_NONNULL_BEGIN
@protocol ZZAddressBookTableViewDelegate <NSObject>

- (void)addModel:(AddressDataModel *)model;

@end
@interface ZZAddressBookTableView : UITableView
@property (nonatomic, strong) NSMutableArray * dataArray;
@property (nonatomic, weak) id <ZZAddressBookTableViewDelegate> addressBookDelegate;
@end

NS_ASSUME_NONNULL_END
