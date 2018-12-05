//
//  ZZAddressSelectedView.m
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import "ZZAddressSelectedView.h"
#import "MyCollectionViewCell.h"

@interface ZZAddressSelectedView()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *mainCollectionView;
}
@end

@implementation ZZAddressSelectedView
- (instancetype)init{
    if (self = [super init]) {
        [self creatUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self creatUI];
    }
    return self;
}
- (void)reloadData{
    [mainCollectionView reloadData];
}
- (void)creatUI{
    //1.初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];

    //该方法也可以设置itemSize
    layout.itemSize =CGSizeMake(110, 150);
    
    //2.初始化collectionView
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    [self addSubview:mainCollectionView];
    mainCollectionView.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [mainCollectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    
    //4.设置代理
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
}

#pragma mark collectionView代理方法
//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    if (self.dataArray.count == indexPath.row + 1) {
        cell.topImage.hidden = YES;
    }else{
        cell.topImage.hidden = NO;
    }
    AddressDataModel * model = self.dataArray[indexPath.row];
    NSInteger level = [model.level integerValue];
    
    if (level == self.dataArray.count-1 && level != 0) {
        cell.botlabel.textColor = [UIColor lightGrayColor];
    }else{
        cell.botlabel.textColor = [UIColor blueColor];
    }
    cell.botlabel.text = [NSString stringWithFormat:@"%@",model.addressName];
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddressDataModel * model = self.dataArray[indexPath.row];

    NSString * text = model.addressName;
    
    return CGSizeMake([self getWidthWithText:text height:30 font:15] + 30, 30);
}
- (CGFloat)getWidthWithText:(NSString *)text height:(CGFloat)height font:(CGFloat)font{
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]}
                                     context:nil];
    return rect.size.width;
}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//设置每个item水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}


//设置每个item垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 15;
}


//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    AddressDataModel * model = self.dataArray[indexPath.row];
    if (self.seletedDelegate && [self.seletedDelegate respondsToSelector:@selector(deletedModel:)]) {
        [self.seletedDelegate deletedModel:model];
    }
}

@end
