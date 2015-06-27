//
//  LendViewController.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "LendViewController.h"
#import "AppDelegate.h"
#import "BorrowViewController.h"

@interface LendViewController ()
@property (weak, nonatomic) IBOutlet UITableView *myItemList;

@end

@implementation LendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate *ad = [[UIApplication sharedApplication] delegate];
    ad.switchFlag = @"LEND";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"ToBorrow"]) {
        
        
    }
}



@end
