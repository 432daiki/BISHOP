//
//  UserNameAndThumbNailView.m
//  BESHOP
//
//  Created by Yuki Uchiyama on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "UserNameAndThumbNailView.h"
#import "LendNavigationController.h"
#import "tuto"

@implementation UserNameAndThumbNailView

- (IBAction)pushStartButton:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LendNavigationController *lnc = [storyBoard instantiateViewControllerWithIdentifier:@"Navi"];
    
    self.window.rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.window.rootViewController presentViewController:lnc animated:NO completion:nil];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
>>>>>>> 940706aab775527e8ee2313b2e4717e709b7f1ec
}
*/

@end
