//
//  ViewController.m
//  ZZAddressBookDemo
//
//  Created by 张张 on 2018/12/3.
//  Copyright © 2018年 张张. All rights reserved.
//

#import "ViewController.h"
#import "AddressDataModel.h"
#import "AddressBookView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSMutableArray * dataArray = [[AddressDataModel defalutModelArray] mutableCopy];
    AddressBookView * bookView = [[AddressBookView alloc]initWithFrame:CGRectMake(0, 88, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    
    AddressDataModel * titleModel = [[AddressDataModel alloc]init];
    titleModel.addressName = @"组织结构";
    titleModel.addressId = @"0000";
    titleModel.level = @"0";
    titleModel.childArray = dataArray;
    NSMutableArray * titleArray = [[NSMutableArray alloc]initWithArray:@[titleModel]];
    [self.view addSubview:bookView];

    [bookView reloadDataWithtTitleArray:titleArray AddressArray:dataArray];

    
}


@end
