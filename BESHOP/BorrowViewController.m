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
#import "AppDelegate.h"

@interface BorrowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property DrawerView *drawerView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@property AppDelegate *ad;

@end

@implementation BorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nibForCell = [UINib nibWithNibName:@"ItemTableViewCell" bundle:nil];
    [self.tableView registerNib:nibForCell forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.drawerView = [[DrawerView alloc] init];
    UINib *nib = [UINib nibWithNibName:@"DrawerView" bundle:nil];
    self.drawerView = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
    self.drawerView.frame = CGRectMake(-375, 0, 375, 667);
    [self.view addSubview:self.drawerView];
    [self.drawerView setting];
    
    self.ad = [[UIApplication sharedApplication] delegate];
    self.ad.animationDirection = @"LEFT";
    
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
    cell.tag = indexPath.row+1;
    
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    UITableViewCell *subCell = [tableView cellForRowAtIndexPath:indexPath];
//    ItemTableViewCell *cell = (ItemTableViewCell*)subCell;
    
    
    self.ad.detailItemView = [[DetailItemView alloc] init];
    UINib *nib = [UINib nibWithNibName:@"DetailItemView" bundle:nil];
    self.ad.detailItemView = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
    self.ad.detailItemView.frame = CGRectMake(0, 667, 375, 667);
    [self.ad.detailItemView setting];
    [self.view addSubview:self.ad.detailItemView];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^(void){
        
        self.ad.detailItemView.frame = CGRectMake(0, 0, 375, 667);
        
    }completion:nil];
}

- (IBAction)pushLeftBarButton:(id)sender {
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        
        if ([self.ad.animationDirection isEqualToString:@"LEFT"]) {
            
            self.drawerView.frame = CGRectMake(0, 0, 375, 667);
            self.ad.animationDirection = @"RIGHT";
        }
        
        else if ([self.ad.animationDirection isEqualToString:@"RIGHT"]){
            
            self.drawerView.frame = CGRectMake(-375, 0, 375, 667);
            self.ad.animationDirection = @"LEFT";
        }
        
    }completion:^(BOOL finished){
        
        if ([self.ad.animationDirection isEqualToString:@"RIGHT"]) {
            
            [self.drawerView showShadow];
        }
    }];
    
}




@end
