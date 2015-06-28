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
#import "AppDelegate.h"

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myItemTableView;


@property NSArray *itemNameArr;
@property NSArray *imageArr;
@property NSArray *priceArr;
@property NSArray *optionArr;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nibForCell = [UINib nibWithNibName:@"MyItemTableViewCell" bundle:nil];
    [self.myItemTableView registerNib:nibForCell forCellReuseIdentifier:@"Cell"];
    self.myItemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    self.myItemTableView.backgroundColor = [UIColor clearColor];
    
    AppDelegate *ad = [[UIApplication sharedApplication] delegate];
    NSLog(@"%@",ad.titlestr);
    
    
    //////
    self.itemNameArr = @[ad.titlestr,@"スキー用具",@"キャンプセット",@"カメラ",@"洋服"];
    self.priceArr = @[ad.priceStr,@"¥8000",@"¥3000",@"¥12000",@"¥500"];
    self.optionArr = @[@"借りられた回数:0",@"借りられた回数:3",@"借りられた回数:5",@"借りられた回数:2",@"借りられた回数:2"];
    
    
    UIImage *image1 = ad.firstImage;
    UIImage *image2 = [UIImage imageNamed:@"a.png"];
    UIImage *image3 = [UIImage imageNamed:@"gasukatorige.png"];
    UIImage *image4 = [UIImage imageNamed:@"camera.png"];
    UIImage *image5 = [UIImage imageNamed:@"k331225787.png"];
    
    self.imageArr = @[image1,image2,image3,image4,image5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return self.itemNameArr.count;
    
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MyItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[MyItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    cell.Thumbnail.image = self.imageArr[indexPath.row];
    cell.ItemPrice.text = self.priceArr[indexPath.row];
    cell.ItemTitle.text = self.itemNameArr[indexPath.row];
    cell.BorrowCount.text = self.optionArr[indexPath.row];
    
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
