//
//  ViewController.h
//  StudentResultDisplay
//
//  Created by MacPro1 on 3/2/16.
//  Copyright © 2016 MacPro1. All rights reserved.
//

#import "tableListView.h"


@interface tableListView ()

@end

@implementation tableListView

- (IBAction)diemToan:(id)sender {
//    [self sortArrayWithString:@"diemtoan"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_listSV count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.contentView.layer.borderColor = [UIColor blackColor].CGColor;
    cell.contentView.layer.borderWidth = 0.25;
    NSMutableDictionary *tmp = [_listSV objectAtIndex:indexPath.row];
    cell.fullName.text = [tmp objectForKey:@"fullname"];
    cell.info.text = [tmp objectForKey:@"diemtoan"];
    return cell;
}

-(void)viewDidAppear:(BOOL)animated{
    [_tableListView reloadData];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
    [self.listSV removeObjectAtIndex:indexPath.row];
        [_tableListView reloadData];
            NSLog(@"try to delete");
    }
}

-(void)sortArrayWithString:(NSString *)string {
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:string
                                                 ascending:YES];
    NSMutableArray *sortDescriptors = [NSMutableArray arrayWithObject:sortDescriptor];
    NSMutableArray *arrayToSort = [NSMutableArray arrayWithArray:_listSV];
    [_listSV removeAllObjects];
    _listSV = [arrayToSort sortedArrayUsingDescriptors:sortDescriptors];
    [_tableListView reloadData];
}

@end
