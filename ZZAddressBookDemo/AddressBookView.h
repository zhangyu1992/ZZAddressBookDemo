//
//  AddressBookView.h
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AddressBookView : UIView
- (void)reloadDataWithtTitleArray:(NSMutableArray *)titleArray AddressArray:(NSMutableArray *)addressArray;
@end

NS_ASSUME_NONNULL_END
