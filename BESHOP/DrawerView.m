//
//  DrawerView.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "DrawerView.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"

@implementation DrawerView



- (void)setting{
    
    self.profileImageView.layer.cornerRadius = 30;
    self.profileImageView.clipsToBounds = YES;
    
    UISwipeGestureRecognizer* swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(pushBlank:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeLeftGesture];

}

- (void)showShadow{
    
    //影
    self.backView.layer.masksToBounds = NO;
    self.backView.layer.cornerRadius = 8;
    self.backView.layer.shadowOffset = CGSizeMake(78, 0);
    self.backView.layer.shadowRadius = 3;
    self.backView.layer.shadowOpacity = 0.6;
}

- (IBAction)pushBlank:(id)sender {
    
    AppDelegate *ad = [[UIApplication sharedApplication] delegate];
    
    self.backView.layer.masksToBounds = YES;
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        
            self.frame = CGRectMake(-375, 0, 375, 667);
        
            ad.animationDirection = @"LEFT";
        
    }completion:nil];
}

@end
