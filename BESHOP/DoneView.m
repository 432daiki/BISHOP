//
//  DoneView.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "DoneView.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@implementation DoneView

- (void)setting{
    
    self.profileImageView.layer.cornerRadius = 51;
    self.profileImageView.clipsToBounds = YES;
}

- (IBAction)pushBackButton:(id)sender {
    
    AppDelegate *ad = [[UIApplication sharedApplication] delegate];
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^(void){
        
        ad.detailItemView.frame = CGRectMake(0, 667, 375, 667);
        
    }completion:^(BOOL finished){
        
        [ad.detailItemView removeFromSuperview];
        
    }];
}


@end
