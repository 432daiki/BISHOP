//
//  EditInfoViewController.m
//  BESHOP
//
//  Created by Yuki Uchiyama on 2015/06/28.
//  Copyright (c) 2015年 Daiki Shimizu. All rights reserved.
//

#import "EditInfoViewController.h"

@interface EditInfoViewController ()<UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@property (weak, nonatomic) IBOutlet UIButton *firstImageView;
@property (weak, nonatomic) IBOutlet UIButton *secondImageView;
@property (weak, nonatomic) IBOutlet UIButton *thirdImageView;


@end

@implementation EditInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textView.delegate = self;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if ([text isEqualToString:@"\n"]) {
        
        NSString *description = textView.text;
        
        [textView resignFirstResponder];
        
        [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^(void){
            
            self.view.center = CGPointMake(187.5,333.5);
            
        }completion:nil];
        
        return NO;
    }
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    
    
    
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    
    textView.text = @"";
    
    [UIView animateWithDuration:0.6 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0.6 options:UIViewAnimationOptionCurveLinear animations:^(void){
        
        self.view.center = CGPointMake(self.view.center.x, 110);
        
    }completion:nil];
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    NSString *str;
    
    if (textField == self.priceTextField) {
        
        NSString *price = textField.text;
    }
    
    else if (textField == self.titleTextField){
        
        NSString *title = textField.text;
    }
    
    return YES;
}

- (IBAction)pushAddImageButton:(id)sender{
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc]init];
        // カメラかライブラリからの読込指定。カメラを指定。
        [imagePickerController setSourceType:UIImagePickerControllerSourceTypeCamera];
        // トリミングなどを行うか否か
        [imagePickerController setAllowsEditing:YES];
        // Delegate
        [imagePickerController setDelegate:self];
        
        // アニメーションをしてカメラUIを起動
        [self presentViewController:imagePickerController animated:YES completion:nil];
    }
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    // オリジナル画像
    UIImage *originalImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
    
    if(!self.firstImageView.tag){
        
        [self.firstImageView setBackgroundImage:originalImage forState:UIControlStateNormal];
        self.firstImageView.tag = 1;
        return;
    }
    
    else if (!self.secondImageView.tag){
        
        [self.secondImageView setBackgroundImage:originalImage forState:UIControlStateNormal];
        self.secondImageView.tag = 1;
        return;
    }
    
    else if (!self.thirdImageView.tag){
        
        [self.thirdImageView setBackgroundImage:originalImage forState:UIControlStateNormal];
        self.thirdImageView.tag = 1;
        return;
    }
}

- (IBAction)pushSendButton:(id)sender {
}




@end
