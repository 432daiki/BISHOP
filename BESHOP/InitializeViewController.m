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
@property (weak, nonatomic) IBOutlet UIPageControl *pageControll;

// User Data
@property (weak, nonatomic) IBOutlet UITextField *mailAdressTextField;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property NSMutableDictionary *resistDic;

@property (strong, nonatomic) IBOutlet UIView *backgroundView;

@end

@implementation InitializeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //
    self.mailAdressTextField.delegate = self;
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.resistDic = [NSMutableDictionary dictionary];
    
    
    
    // Create Opening Views
    NSArray *OpeningViewNames = [NSArray arrayWithObjects:@"OpeningView1", @"OpeningView2", @"OpeningView3", nil];
                                 //@"MailAndPassView", @"UserNameAndThumbNailView", nil];
    int screenWidth = 375;
    self.scrollView.contentSize  = CGSizeMake(screenWidth * [OpeningViewNames count], 667);

    
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
    
    [[UIImage imageNamed:@"Sample001.png"] drawInRect:self.view.bounds];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if ((textField = self.mailAdressTextField)) {
        self.resistDic[@"MAIL"] = textField.text;
    }
    else if (textField == self.userNameTextField){
        self.resistDic[@"NAME"] = textField.text;
    }
    else if (textField == self.passwordTextField){
        self.resistDic[@"PASS"] = textField.text;
    }
    return YES;
}

@end
