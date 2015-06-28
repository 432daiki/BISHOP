//
//  ListViewController.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/28.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "ListViewController.h"
#import "MyItemTableViewCell.h"
#import "EditInfoViewController.h"
#import "BorrowViewController.h"

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myItemTableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nibForCell = [UINib nibWithNibName:@"MyItemTableViewCell" bundle:nil];
    [self.myItemTableView registerNib:nibForCell forCellReuseIdentifier:@"Cell"];
    self.myItemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.myItemTableView.backgroundColor = [UIColor clearColor];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[MyItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.tag = indexPath.row+1;
    
    //影
    cell.itemContent.layer.masksToBounds = NO;
    cell.itemContent.layer.cornerRadius = 8;
    cell.itemContent.layer.shadowOffset = CGSizeMake(0, 0);
    cell.itemContent.layer.shadowRadius = 3;
    cell.itemContent.layer.shadowOpacity = 0.1;
    
    return cell;
}

- (IBAction)pushAddButon:(id)sender {
    
    EditInfoViewController *eivc = [self.storyboard instantiateViewControllerWithIdentifier:@"Edit"];
    self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:eivc animated:YES completion:nil];
}

- (IBAction)pushFlipButton:(id)sender {
    
    BorrowViewController *bvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Borrow"];
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:bvc animated:YES completion:nil];
}

@end
