//
//  DoneView.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "DoneView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DoneView

- (void)makeCornerRadius{
    
    self.profileImageView.layer.cornerRadius = 51;
    self.profileImageView.clipsToBounds = YES;
}

- (IBAction)pushBackButton:(id)sender {
}

@end