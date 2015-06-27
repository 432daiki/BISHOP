//
//  DetailItemView.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "DetailItemView.h"
#import <QuartzCore/QuartzCore.h>
#import "BorrowViewController.h"
#import "AppDelegate.h"

@implementation DetailItemView

- (void)setting{
    
    self.profileImageView.layer.cornerRadius = 29;
    self.profileImageView.clipsToBounds = YES;
}

- (IBAction)pushBorrowButton:(id)sender {
    
    self.doneView = [[DoneView alloc] init];
    UINib *nib = [UINib nibWithNibName:@"DoneView" bundle:nil];
    self.doneView = [[nib instantiateWithOwner:nil options:nil]objectAtIndex:0];
    self.doneView.frame = CGRectMake(0, 0, 375, 667);
    
    self.doneView.alpha = 0;
    self.doneView.blowoffView.alpha = 0;
    self.doneView.triangleImageView.alpha = 0;
    
    [self.doneView setting];
    
    AppDelegate *ad = [[UIApplication sharedApplication] delegate];
    [ad.detailItemView addSubview:self.doneView];
    
    [UIView animateWithDuration:1.2 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^(void){
        
        self.doneView.alpha = 1;
        
    }completion:^(BOOL finished){
        
        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^(void){
            
            self.doneView.blowoffView.alpha = 1;
            self.doneView.triangleImageView.alpha = 1;
            
        }completion:nil];
        
    }];
}

@end
