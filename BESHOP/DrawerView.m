//
//  DrawerView.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "DrawerView.h"
#import <QuartzCore/QuartzCore.h>
#import "LendViewController.h"
#import "BorrowViewController.h"

@implementation DrawerView



- (void)setting{
    
    self.profileImageView.layer.cornerRadius = 30;
    self.profileImageView.clipsToBounds = YES;
    
    UISwipeGestureRecognizer* swipeLeftGesture =
    [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(pushBlank:)];
    swipeLeftGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self addGestureRecognizer:swipeLeftGesture];
    
    self.ad = [[UIApplication sharedApplication] delegate];
    
    NSString *str;
    if ([self.ad.switchFlag isEqualToString:@"LEND"]) {
        
        str = @"借りる";
    }
    else if ([self.ad.switchFlag isEqualToString:@"BORROW"]){
        
        str = @"貸す";
    }
    
    NSLog(@"%@",str);
    
    [self.switchButton setTitle:[NSString stringWithFormat:@"「%@」にスイッチ",str] forState:UIControlStateNormal];
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
    
    
    self.backView.layer.masksToBounds = YES;
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^{
        
            self.frame = CGRectMake(-375, 0, 375, 667);
        
            self.ad.animationDirection = @"LEFT";
        
    }completion:nil];
}

- (IBAction)pushSwitchButton:(id)sender {
    
    [self pushBlank:nil];
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    //借りるに遷移
    if ([self.ad.switchFlag isEqualToString:@"LEND"]) {
        
        /*
        LendViewController *lvc = [[LendViewController alloc] init];
        lvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
       BorrowViewController *bvc = [storyBoard instantiateViewControllerWithIdentifier:@"Borrow"];
        [lvc presentViewController:bvc animated:YES completion:nil];*/
        
        LendViewController *lvc = [[LendViewController alloc] init];
        [lvc flip];
    }
    
    //貸すに遷移
    else if ([self.ad.switchFlag isEqualToString:@"BORROW"]){
        
        /*
        BorrowViewController *bvc = [[BorrowViewController alloc] init];
        bvc.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        
        LendViewController *lvc = [storyBoard instantiateViewControllerWithIdentifier:@"Lend"];
        [bvc presentViewController:lvc animated:YES completion:nil];*/
        
        BorrowViewController *bvc = [[BorrowViewController alloc] init];
        
        [bvc flip];
    }
}


@end
