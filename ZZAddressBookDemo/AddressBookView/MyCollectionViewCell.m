//
//  MyCollectionViewCell.m
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import "MyCollectionViewCell.h"
#import "Masonry.h"
@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _topImage  = [[UIImageView alloc] init];
        _topImage.image = [UIImage imageNamed:@"ic_hs_tableView_arrow"];
        [self.contentView addSubview:_topImage];
        
        _botlabel = [[UILabel alloc] init];
        _botlabel.textAlignment = NSTextAlignmentCenter;
        _botlabel.textColor = [UIColor blueColor];
        _botlabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_botlabel];
        [_botlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top);
            make.left.equalTo(self.contentView.mas_left);
            make.right.equalTo(self.topImage.mas_right).offset(-10);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        [_topImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(8));
            make.height.equalTo(@(12));
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).offset(10);
        }];
        
    }
    
    return self;
}
@end
