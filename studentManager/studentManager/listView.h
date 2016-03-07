//
//  ViewController.h
//  StudentResultDisplay
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
//#import "Header.h"
//NSMutableArray *_listSV;
@interface listView : UIViewController
//@property NSArray* listSV;
@property NSMutableArray *listSV;
@property int indexSelected;
@property NSInteger count;
@property (strong, nonatomic) IBOutlet UILabel *counter;
@property (strong, nonatomic) IBOutlet UITextField *fullName;
@property (strong, nonatomic) IBOutlet UITextField *birth;
@property (strong, nonatomic) IBOutlet UITextField *diemVan;
@property (strong, nonatomic) IBOutlet UITextField *diemToan;
@property (strong, nonatomic) IBOutlet UITextField *diemLy;
@property (strong, nonatomic) IBOutlet UITextField *diemSu;
- (IBAction)btnFirst:(id)sender;
- (IBAction)btnPrevious:(id)sender;
- (IBAction)btnNext:(id)sender;
- (IBAction)btnLast:(id)sender;
- (IBAction)btnDelete:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnDelete;
- (void)showInformationOfIndex:(int)index;
@property (nonatomic,strong) id<recieveDataBack> delegate;


@end
