//
//  ViewController.m
//  BESHOP
//
//  Created by 清水 大輝 on 2015/06/27.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *mailAdressTextField;
@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property NSMutableDictionary *resistDic;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mailAdressTextField.delegate = self;
    self.userNameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    self.resistDic = [NSMutableDictionary dictionary];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ((textField = self.mailAdressTextField)) {
        
        self.resistDic[@"MAIL"] = textField.text;
    }
    
    else if (textField == self.userNameTextField){
        
        self.resistDic[@"NAME"] = textField.text;
    }
    
    else if (textField == self.passwordTextField){
        
        self.resistDic[@"PASS"] = textField.text;
    }
    
    
    return YES;
}

- (IBAction)inputMailAdress:(id)sender {
    
    UITextField *textField = (UITextField*)sender;
    NSString *mailAdress = textField.text;
    NSLog(@"%@",mailAdress);
    
}

- (IBAction)pushResistButton:(id)sender {
}

- (IBAction)inputUserName:(id)sender {
    
    UITextField *textField = (UITextField*)sender;
    NSString *userName = textField.text;
}
- (IBAction)inputPassword:(id)sender {
    
    UITextField *textField = (UITextField*)sender;
    NSString *password = textField.text;
}


@end
