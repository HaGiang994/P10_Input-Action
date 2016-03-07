//
//  ViewController.h
//  StudentResultDisplay
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol recieveDataBack
- (void)recieveData:(NSMutableArray *)array;
@end

@interface ViewController : UIViewController <recieveDataBack>

@property (strong, nonatomic) IBOutlet UITextField *fullName;
@property (strong, nonatomic) IBOutlet UITextField *birth;
@property (strong, nonatomic) IBOutlet UITextField *diemVan;
@property (strong, nonatomic) IBOutlet UITextField *diemToan;
@property (strong, nonatomic) IBOutlet UITextField *diemLy;
@property (strong, nonatomic) IBOutlet UITextField *diemSu;
@property (strong, nonatomic) IBOutlet UILabel *lblNoti;
- (IBAction)btnSave:(id)sender;
- (IBAction)btnHightestScore:(id)sender;
//- (IBAction)btnListView:(id)sender;
- (IBAction)btnListView:(id)sender;
- (IBAction)btnListSV:(id)sender;

@property NSMutableArray *listSV;

@end

