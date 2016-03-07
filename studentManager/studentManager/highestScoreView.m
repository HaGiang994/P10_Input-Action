//
//  ViewController.h
//  StudentResultDisplay
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import "highestScoreView.h"

@interface highestScoreView ()

@end


@implementation highestScoreView



- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFrame];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)diemVan:(id)sender {
    [self showInfoOfMon:@"diemvan"];
}

- (IBAction)diemToan:(id)sender {
    [self showInfoOfMon:@"diemtoan"];
}

- (IBAction)diemSu:(id)sender {
    [self showInfoOfMon:@"diemsu"];
}
- (IBAction)diemLy:(id)sender {
    [self showInfoOfMon:@"diemly"];
}
- (void)setFrame {
    _fullName.enabled = NO;
    _score.enabled = NO;
}

-(int)highestScoreWithString:(NSString *)string {
    int indexOfMaxValue = 0;
    NSInteger quantity = [_listSV count];
    for (int i = 1;  i < quantity; i++) {
        if ([[[_listSV objectAtIndex:indexOfMaxValue] objectForKey:string] floatValue ] < [[[_listSV objectAtIndex:i] objectForKey:string] floatValue])
            indexOfMaxValue = i;
    }
    return indexOfMaxValue;
}

- (void)showInformationOfIndex :(int)index string:(NSString *)string{
    if ([_listSV count] > 0) {
        _fullName.text = [[_listSV objectAtIndex:index] objectForKey:@"fullname"];
        _score.text = [[_listSV objectAtIndex:index] objectForKey:string];
        NSString *mon;
        if ([string isEqualToString:@"diemvan"])
        {
            mon = @"Môn Văn";
        } else if ([string isEqualToString:@"montoan"]){
            mon = @"Môn Toán";
        } else if ([string isEqualToString:@"monly"]){
            mon = @"Môn Lý";
        } else {
            mon = @"Môn Sử";
        }
    } else {
        _fullName.text = @"";
        _score.text= @"";
        _lblTitle.text = @"Điểm Cao Nhất";
    }
}

-(void)showInfoOfMon:(NSString *)string {
    int index = [self highestScoreWithString:string];
    [self showInformationOfIndex:index string:string];
}

- (void)viewDidAppear:(BOOL)animated {
    if ([_listSV count] < 1) {
        _fullName.text = @"";
        _score.text= @"";
        _lblTitle.text = @"Điểm Cao Nhất";
    }
}

@end
