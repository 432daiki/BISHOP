//
//  DoneView.h
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoneView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;

- (void)setting;
@property (weak, nonatomic) IBOutlet UIView *blowoffView;
@property (weak, nonatomic) IBOutlet UIImageView *triangleImageView;

@end
