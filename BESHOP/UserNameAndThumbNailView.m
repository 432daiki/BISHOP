//
//  UserNameAndThumbNailView.m
//  BESHOP
//
//  Created by Yuki Uchiyama on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "UserNameAndThumbNailView.h"
#import "InitializeViewController.h"
#import "TutorialViewController1ViewController.h"

@implementation UserNameAndThumbNailView

- (IBAction)pushStartButton:(id)sender {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    TutorialViewController1ViewController *tcv = [storyBoard instantiateViewControllerWithIdentifier:@"Tutorial1"];

    self.window.rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.window.rootViewController presentViewController:tcv animated:NO completion:nil];
}

@end
