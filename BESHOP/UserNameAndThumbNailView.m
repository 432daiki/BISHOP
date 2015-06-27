//
//  UserNameAndThumbNailView.m
//  BESHOP
//
//  Created by Yuki Uchiyama on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "UserNameAndThumbNailView.h"
#import "TutorialViewController1ViewController.h"
#import "LendNavigationController.h"

@implementation UserNameAndThumbNailView

- (IBAction)pushStartButton:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LendNavigationController *lnc = [storyBoard instantiateViewControllerWithIdentifier:@"Navi"];
    
    self.window.rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.window.rootViewController presentViewController:lnc animated:NO completion:nil];
}

@end
