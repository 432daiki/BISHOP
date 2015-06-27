//
//  DrawerView.h
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawerView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
- (void)setting;
@property (weak, nonatomic) IBOutlet UIView *backView;
- (void)showShadow;

@end
