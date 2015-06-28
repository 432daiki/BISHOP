//
//  ListViewController.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/28.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "ListViewController.h"
#import "MyItemTableViewCell.h"

@interface ListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myItemTableView;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nibForCell = [UINib nibWithNibName:@"MyItemTableViewCell" bundle:nil];
    [self.myItemTableView registerNib:nibForCell forCellReuseIdentifier:@"Cell"];
    self.myItemTableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
