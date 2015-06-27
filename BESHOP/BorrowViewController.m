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
#import "DrawerView.h"

@interface BorrowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property DrawerView *drawerView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

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



- (IBAction)pushLeftBarButton:(id)sender {
    
    UINib *nib = [UINib nibWithNibName:@"DrawerView" bundle:nil];
    self.drawerView = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
    self.drawerView.frame = CGRectMake(-160, 0, 160, 667);
    [self.view addSubview:self.drawerView];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        
        self.navigationBar.frame = CGRectMake(160, 20, 375, 44);
        
        self.tableView.frame = CGRectMake(160, 64, 378, 608);
        
        self.drawerView.frame = CGRectMake(0, 0, 160, 667);
        
    }completion:nil];
    
}




@end
