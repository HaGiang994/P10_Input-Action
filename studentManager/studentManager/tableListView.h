//
//  tableListView.h
//  studentManager
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCell.h"

@interface tableListView : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet TableViewCell *tableView;
@property NSMutableArray *listSV;
@property (strong, nonatomic) IBOutlet UITableView *tableListView;
- (IBAction)diemToan:(id)sender;

@end
