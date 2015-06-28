//
//  OpeningVIew3.m
//  BESHOP
//
//  Created by Yuki Uchiyama on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "OpeningView3.h"
#import "RegisterViewController.h"

@implementation OpeningView3
- (IBAction)registerButton:(id)sender {
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    RegisterViewController *rvc = [storyBoard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
    self.window.rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self.window.rootViewController presentViewController:rvc animated:YES completion:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
