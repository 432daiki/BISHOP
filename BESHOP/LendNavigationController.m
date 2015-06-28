//
//  LendNavigationController.m
//  BESHOP
//
//  Created by Yuki Uchiyama on 2015/06/28.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "LendNavigationController.h"

@interface LendNavigationController ()
@property (weak, nonatomic) IBOutlet UINavigationBar *naviBar;

@end

@implementation LendNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    //[UINavigationBar appearance].barTintColor = [UIColor colorWithRed:90.0/255.0 green:85.0/255.0 blue:75.0/255.0 alpha:0.5];
    self.navigationBar.translucent  = YES;
    self.navigationController.navigationBar.alpha  = 0.5f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
