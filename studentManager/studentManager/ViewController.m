//
//  ViewController.m
//  studentManager
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import "ViewController.h"
#import "listView.h"
#import "highestScoreView.h"
#import "tableListView.h"

NSInteger count;
UIStoryboard *storyboard;
listView *listViewController;
highestScoreView *highestScoreViewColler;
tableListView *tableListViewController;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _listSV = [[NSMutableArray alloc] init];
    listViewController.listSV = [[NSMutableArray alloc] init];
    highestScoreViewColler.listSV = [[NSMutableArray alloc] init];
    tableListViewController.listSV = [[NSMutableArray alloc] init];
    count = 0;
    storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    listViewController = [storyboard instantiateViewControllerWithIdentifier:@"listView"];
    highestScoreViewColler = [storyboard instantiateViewControllerWithIdentifier:@"highestScoreView"];
    tableListViewController = [storyboard instantiateViewControllerWithIdentifier:@"tableListView"];
//    listViewController = [[listView alloc] initWithNibName:@"listViewController" bundle:nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnSave:(id)sender {
    if ([self checkStatement]) {
    [self getData];
    }
}
//
//- (IBAction)btnHightestScore:(id)sender {
//}

//- (IBAction)btnListView:(id)sender {
//}

-(void)getData {
    count++;
    _lblNoti.text = [NSString stringWithFormat:@"Đã lưu thành công %ld sinh viên",(long)count];
    NSMutableDictionary *sinhvien = [NSMutableDictionary dictionaryWithDictionary:@{@"fullname":_fullName.text,
                                                                                    @"birth":_birth.text,
                                                                                    @"diemvan":_diemVan.text,
                                                                                    @"diemtoan":_diemToan.text,
                                                                                    @"diemly":_diemLy.text,
                                                                                    @"diemsu":_diemSu.text}];
    [_listSV addObject:sinhvien];
    NSLog(@"%lu",(unsigned long)[_listSV count]);
}
-(BOOL)checkStatement {
    if (_fullName.text.length <= 4 || _fullName.text.length >= 100) {
        [self showError:@"Họ và tên phải nhiều hơn 4 ký tự và ít hơn 100 ký tự"];
        return NO;
    }
    if (!([self checkMark:_diemVan] &&
        [self checkMark:_diemToan] &&
        [self checkMark:_diemLy] &&
        [self checkMark:_diemSu])) {
        [self showError:@"Điểm số phải nằm trong khoảng từ 0 đến 10"];
        return NO;
    }
    return YES;
}
-(void)showError:(NSString*)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lỗi" message:error delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

-(BOOL)checkMark:(UITextField *)mark {
    if ([mark.text floatValue] < 0 || [mark.text floatValue] > 10) {
        return NO;
    }
    return YES;
}
- (IBAction)btnListView:(id)sender {
    //[self presentViewController:dest animated:YES completion:nil];
    listViewController.listSV = [NSMutableArray arrayWithArray:_listSV];
    [self.navigationController pushViewController:listViewController animated:YES];
}

- (IBAction)btnListSV:(id)sender {
    tableListViewController.listSV = [NSMutableArray arrayWithArray:_listSV];
    NSLog(@"xxxxxxxxx");
    [self.navigationController pushViewController:tableListViewController animated:YES];
}
- (IBAction)btnHightestScore:(id)sender {
    highestScoreViewColler.listSV = [NSMutableArray arrayWithArray:_listSV];
    [self.navigationController pushViewController:highestScoreViewColler animated:YES];
}
//- (void)cocau{
//    _fullName.text = @"Quang Pham";
//    _birth.text = @"12/06";
//    _diemToan.text = @"10";
//    _diemLy.text = @"10";
//    _diemVan.text = @"10";
//    _diemSu.text = @"10";
//}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
       NSLog(@"Holy Shit");
    UIViewController *controller = [segue destinationViewController];
    if ([controller isKindOfClass:[listView class]]) {
        NSLog(@"check it OK sir");
        listView *listViewController = (listView *)controller;
        listViewController.delegate = self;
    }
    if ([segue.identifier isEqualToString:@"listView"]) {
        NSLog(@"listView");
    }
}

-(void)recieveData:(NSMutableArray *)array {
    [_listSV removeAllObjects];
    _listSV = [NSMutableArray arrayWithArray:array];
    NSLog(@"I have receive data successful");
}

-(void)viewDidAppear:(BOOL)animated {
    [_listSV removeAllObjects];
    _listSV = [NSMutableArray arrayWithArray: listViewController.listSV];
}

@end
