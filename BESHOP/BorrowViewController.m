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
#import "ListViewController.h"

@interface BorrowViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property DrawerView *drawerView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;

@property AppDelegate *ad;



@property NSArray *nameArr;
@property NSArray *imageArr;
@property NSArray *profileArr;

@end

@implementation BorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.ad = [[UIApplication sharedApplication] delegate];
    self.ad.switchFlag = @"BORROW";
    
    UINib *nibForCell = [UINib nibWithNibName:@"ItemTableViewCell" bundle:nil];
    [self.tableView registerNib:nibForCell forCellReuseIdentifier:@"Cell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.drawerView = [[DrawerView alloc] init];
    UINib *nib = [UINib nibWithNibName:@"DrawerView" bundle:nil];
    self.drawerView = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
    self.drawerView.frame = CGRectMake(-375, 0, 375, 667);
    [self.view addSubview:self.drawerView];
    [self.drawerView setting];
    
    self.ad.animationDirection = @"LEFT";
    
    
    NSString *urlStr = @"http://winvelab.in/beshop/items";
    NSURL *URL = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSData *json_data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:json_data options:NSJSONReadingAllowFragments error:nil];
    NSLog(@"%@",jsonObject);
    
    
   
    
    self.nameArr = @[@"釣り具",@"カメラ",@"着物",@"サーフボード",@"ギター"];
    
    UIImage *image1 = [UIImage imageNamed:@"9330911290774.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"a.png"];
    UIImage *image3 = [UIImage imageNamed:@"wada1.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"01101151_52cf6047dd3dd-2.jpg"];
    UIImage *image5 = [UIImage imageNamed:@"3_peces.jpg"];
    
    self.imageArr = @[image1,image2,image3,image4,image5];
    
    UIImage *image10 = [UIImage imageNamed:@"PAK86_kuzureochiru20140713-thumb-815xauto-17275.jpg"];
    UIImage *image20 = [UIImage imageNamed:@"11145066_830295770382605_8492820296412019713_n.jpg"];
    UIImage *image30 = [UIImage imageNamed:@"LIG_shinsangirigira-thumb-815xauto-16033.jpg"];
    UIImage *image40 = [UIImage imageNamed:@"01101151_52cf6047dd3dd-2.jpg"];
    UIImage *image50 = [UIImage imageNamed:@"3_peces.jpg"];
    
    self.profileArr = @[image10,image20,image30,image40,image50];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.nameArr.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.backgroundColor = [UIColor clearColor];
    
    
    AppDelegate *ad = [[UIApplication sharedApplication] delegate];
    cell.itemImageView.image = ad.firstImage;
    cell.userNameLabel.text = ad.titlestr;
    cell.userImageView.image = [UIImage imageNamed:@"11145066_830295770382605_8492820296412019713_n.jpg"];
    
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


- (IBAction)pushFlipButton:(id)sender {
    
    
    ListViewController *lvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Lend"];
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:lvc animated:YES completion:nil];
    
}



@end
