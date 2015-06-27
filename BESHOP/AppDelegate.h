//
//  AppDelegate.h
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailItemView.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property NSString *animationDirection;

@property DetailItemView *detailItemView;
@property NSString *switchFlag;


//データを格納する配列
@property NSMutableArray *itemNameArr;
@property NSMutableArray *itemImageURLArr;

@end

