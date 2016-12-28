//
//  WenJianCaoZuoTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/13.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "WenJianCaoZuoTableViewController.h"


@interface WenJianCaoZuoTableViewController ()

@end

@implementation WenJianCaoZuoTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        GuiDangTableViewController* guidangTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"guidangTVC"];
        [self.navigationController pushViewController:guidangTVC animated:YES];
    }else if (indexPath.row == 1) {
        NSFileManagerTableViewController* nsfilemanagerTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"nsfilemanagerTVC"];
        [self.navigationController pushViewController:nsfilemanagerTVC animated:YES];
    }else if (indexPath.row == 2) {
        PListTableViewController* plistTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"plistTVC"];
        [self.navigationController pushViewController:plistTVC animated:YES];
    }else if (indexPath.row == 3) {
        NSUserDefaultsTableViewController* nsuserdefaultsTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"nsuserdefaultsTVC"];
        [self.navigationController pushViewController:nsuserdefaultsTVC animated:YES];
    }else if (indexPath.row == 4) {
        DuiXiangCunQuTableViewController* duixiangcunquTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"duixiangcunquTVC"];
        [self.navigationController pushViewController:duixiangcunquTVC animated:YES];
    }
}

@end
