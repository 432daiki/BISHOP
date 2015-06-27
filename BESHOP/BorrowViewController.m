//
//  BorrowViewController.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "BorrowViewController.h"
#import "ItemTableViewCell.h"
#import <QuartzCore/QuartzCore.h>

@interface BorrowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation BorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nibForCell = [UINib nibWithNibName:@"ItemTableViewCell" bundle:nil];
    [self.tableView registerNib:nibForCell forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    cell.userImageView.layer.cornerRadius = 13.5;
    cell.userImageView.clipsToBounds = YES;
    
    //影
    cell.itemImageView.layer.masksToBounds = NO;
    cell.itemImageView.layer.cornerRadius = 8;
    cell.itemImageView.layer.shadowOffset = CGSizeMake(0, 0);
    cell.itemImageView.layer.shadowRadius = 3;
    cell.itemImageView.layer.shadowOpacity = 0.1;
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([[segue identifier] isEqualToString:@"ToLend"]) {
        
        
    }
}




@end
