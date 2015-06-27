//
//  DetailItemView.h
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailItemView : UIView


@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet UILabel *ItemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UILabel *starLabel;
@property (weak, nonatomic) IBOutlet UILabel *starNumLabel;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
