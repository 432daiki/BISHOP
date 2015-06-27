//
//  InitializeViewController.m
//  BESHOP
//
//  Created by Yuki Uchiyama on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "InitializeViewController.h"
#import "OpeningView1.h"
#import "OpeningView2.h"
#import "OpeningView3.h"
#import "MailAndPassView.h"
#import "UserNameAndThumbNailView.h"

@interface InitializeViewController ()
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation InitializeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int screenWidth = 375;
    self.scrollView.contentSize  = CGSizeMake(screenWidth*5, 667);
    
    NSArray *OpeningViewNames = [NSArray arrayWithObjects:@"OpeningView1", @"OpeningView2", @"OpeningView3", @"MailAndPassView", @"UserNameAndThumbNailView", nil];
    
    for (NSInteger i=0; i < [OpeningViewNames count]; i++) {
        UINib *nib = [UINib nibWithNibName:OpeningViewNames[i] bundle:nil];
        
        if (i == 0) {
            OpeningView1 *ov1;
            ov1 = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
            ov1.frame = CGRectMake(screenWidth * i, 0, 375, 667);
            [self.scrollView addSubview:ov1];
        }
        if (i == 1) {
            OpeningView2 *ov2;
            ov2 = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
            ov2.frame = CGRectMake(screenWidth * i, 0, 375, 667);
            [self.scrollView addSubview:ov2];
        }
        if (i == 2) {
            OpeningView3 *ov3;
            ov3 = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
            ov3.frame = CGRectMake(screenWidth * i, 0, 375, 667);
            [self.scrollView addSubview:ov3];
        }
        if (i == 3) {
            MailAndPassView *mpV;
            mpV = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
            mpV.frame = CGRectMake(screenWidth * i, 0, 375, 667);
            [self.scrollView addSubview:mpV];
        }
        if (i == 4) {
            UserNameAndThumbNailView *ntV;
            ntV = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
            ntV.frame = CGRectMake(screenWidth * i, 0, 375, 667);
            [self.scrollView addSubview:ntV];
        }
    }
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
