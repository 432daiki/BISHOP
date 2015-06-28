//
//  MyItemTableViewCell.h
//  
//
//  Created by Yuki Uchiyama on 2015/06/28.
//
//

#import <UIKit/UIKit.h>

@interface MyItemTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *Thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *ItemTitle;
@property (weak, nonatomic) IBOutlet UILabel *ItemPrice;
@property (weak, nonatomic) IBOutlet UILabel *BorrowCount;
@property (weak, nonatomic) IBOutlet UILabel *ItemStatus;
@property (weak, nonatomic) IBOutlet UIView *itemContent;

@end
