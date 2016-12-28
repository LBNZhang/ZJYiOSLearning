//
//  ChongYongCellTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/11/3.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "ChongYongCellTableViewController.h"

@interface ChongYongCellTableViewController ()

@end

@implementation ChongYongCellTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.navigationController.navigationBar.hidden = YES;
    
    //self.tableView registerClass:<#(nullable Class)#> forCellReuseIdentifier:<#(nonnull NSString *)#>
    //self.tableView registerNib:<#(nullable UINib *)#> forCellReuseIdentifier:<#(nonnull NSString *)#>
    //self.tableView registerNib:<#(nullable UINib *)#> forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>
    //self.tableView registerClass:<#(nullable Class)#> forHeaderFooterViewReuseIdentifier:<#(nonnull NSString *)#>
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChongYongTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"chongyongCell" forIndexPath:indexPath];
    
    cell.lbl.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];

    if (indexPath.row <= 15) {
        cell.contentView.backgroundColor = [UIColor colorWithRed:(245-indexPath.row*10)/255.0f green:(255-indexPath.row*10)/255.0f blue:(230-indexPath.row*10)/255.0f alpha:1.0f];
    }
    
    UIView* view = [cell viewWithTag:10001];
    if (view) {
        [view removeFromSuperview];
    }
    UIView* view2 = [cell viewWithTag:10002];
    if (view2) {
        [view2 removeFromSuperview];
    }
    
    if (indexPath.row == 0) {
        UILabel* lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 80, 30)];
        lbl2.text = @"mmmmmm";
        lbl2.tag = 10001;
        [cell.contentView addSubview:lbl2];
    }else if (indexPath.row == 1) {
        UILabel* lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(100, 10, 80, 30)];
        lbl2.tag = 10002;
        lbl2.text = @"pppppp";
        [cell.contentView addSubview:lbl2];
    } else {

    }
    
    return cell;
}

@end
