//
//  MainTableViewController.m
//  ZJYiOSLearning
//
//  Created by 张靖尧 on 16/10/12.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import "MainTableViewController.h"
#import "Global.h"
#import "DelegateTestViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    //不知道为什么会有这个问题，但如果不加这句话一运行app进入这个页面就会开始频繁的推送
    for (UILocalNotification* notification in [[UIApplication sharedApplication] scheduledLocalNotifications]) {
        NSDictionary* dic = notification.userInfo;
        if ([[dic objectForKey:@"key"] isEqualToString:@"name"]) {
            [[UIApplication sharedApplication] cancelLocalNotification:notification];
        }
    }
    
    if (startAppType == 1) {
        TuiSongViewController* tuisongVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tuisongVC"];
        [self.navigationController pushViewController:tuisongVC animated:YES];
    }else if (startAppType == 2) {
        TongZhiViewController* tongzhiVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tongzhiVC"];
        [self.navigationController pushViewController:tongzhiVC animated:YES];
    }else if (startAppType == 3) {
        DTouchViewController* dtouchVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"dtouchVC"];
        [self.navigationController pushViewController:dtouchVC animated:YES];
    }else if (startAppType == 4) {
        FenXiangViewController* fenxiangVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"fenxiangVC"];
        [self.navigationController pushViewController:fenxiangVC animated:YES];
    }else if (startAppType == 5) {
        WaterImgViewController* waterimgVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"waterimgVC"];
        [self.navigationController pushViewController:waterimgVC animated:YES];
    }else if (startAppType == 6) {
        AFNetworkingViewController* networkrequestVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"networkrequestVC"];
        [self.navigationController pushViewController:networkrequestVC animated:YES];
    }
    
    startAppType = 0;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
    }else if (indexPath.row == 1) {
        //本地通知
        TongZhiViewController* tongzhiVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tongzhiVC"];
        [self.navigationController pushViewController:tongzhiVC animated:YES];
    }else if (indexPath.row == 2) {
        
    }else if (indexPath.row == 3) {
        
    }else if (indexPath.row == 4) {
        //文件操作页面
        WenJianCaoZuoTableViewController* wenjiancaozuoTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"wenjiancaozuoTVC"];
        [self.navigationController pushViewController:wenjiancaozuoTVC animated:YES];
    }else if (indexPath.row == 5) {
        //水印
        WaterImgViewController* waterimgVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"waterimgVC"];
        [self.navigationController pushViewController:waterimgVC animated:YES];
    }else if (indexPath.row == 6) {
        //网络请求
        NetworkRequestViewController* networkrequestVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"networkrequestVC"];
        [self.navigationController pushViewController:networkrequestVC animated:YES];
    }else if (indexPath.row == 7) {
        //block传值
        BlockViewController* blockVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"blockVC"];
        [self.navigationController pushViewController:blockVC animated:YES];
    }else if (indexPath.row == 8) {
        //扫码
        SaoMaViewController* saomaVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"saomaVC"];
        [self.navigationController pushViewController:saomaVC animated:YES];
    }else if (indexPath.row == 9) {
        //扫码2
        SaoMa2ViewController* saoma2VC = [mainStoryboard instantiateViewControllerWithIdentifier:@"saoma2VC"];
        [self.navigationController pushViewController:saoma2VC animated:YES];
    }else if (indexPath.row == 10) {
        //自定义TabBarController
        ZJYTabBarViewController* zjytabbarVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"zjytabbarVC"];
        [self.navigationController pushViewController:zjytabbarVC animated:YES];
    }else if (indexPath.row == 11) {
        //gcd
        GCDViewController* gcdVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"gcdVC"];
        [self.navigationController pushViewController:gcdVC animated:YES];
    }else if (indexPath.row == 12) {
        //nstimer
        NSTimerViewController* nstimerVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"nstimerVC"];
        [self.navigationController pushViewController:nstimerVC animated:YES];
    }else if (indexPath.row == 13) {
        //
        GCD1ViewController* gcd1VC = [mainStoryboard instantiateViewControllerWithIdentifier:@"gcd1VC"];
        gcd1VC.age = 999;
        
        NSLog(@"%ld",(long)gcd1VC.age);
        [self.navigationController pushViewController:gcd1VC animated:YES];
    }else if (indexPath.row == 14) {
        //NSCoping相关
        ViewController1* VC1 = [mainStoryboard instantiateViewControllerWithIdentifier:@"VC1"];
        [self.navigationController pushViewController:VC1 animated:YES];
    }else if (indexPath.row == 15) {
        //DelegateTest
        DelegateTestViewController* delegatetestVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"delegatetestVC"];
        [self.navigationController pushViewController:delegatetestVC animated:YES];
    }else if (indexPath.row == 16) {
        //BlockTest
        BlockTestViewController* blocktestVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"blocktestVC"];
        [self.navigationController pushViewController:blocktestVC animated:YES];
    }else if (indexPath.row == 17) {
        //notification传值
        NotificationChuanZhiViewController* notificationchuanzhiVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"notificationchuanzhiVC"];
        [self.navigationController pushViewController:notificationchuanzhiVC animated:YES];
    }else if (indexPath.row == 18) {
        //webview加载网页
        WebViewWangYeViewController* webviewwangyeVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"webviewwangyeVC"];
        [self.navigationController pushViewController:webviewwangyeVC animated:YES];
    }else if (indexPath.row == 19) {
        //重用cell
        ChongYongCellTableViewController* chongyongcellTVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"chongyongcellTVC"];
        [self.navigationController pushViewController:chongyongcellTVC animated:YES];
    }else if (indexPath.row == 20) {
        //红包
        HongBaoViewController* hongbaoVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"hongbaoVC"];
        [self.navigationController pushViewController:hongbaoVC animated:YES];
    }else if (indexPath.row == 21) {
        //本地化
        BendihuaViewController* bendihuaVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"bendihuaVC"];
        [self.navigationController pushViewController:bendihuaVC animated:YES];
    }else if (indexPath.row == 22) {
        //统计
        TongJiViewController* tongjiVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"tongjiVC"];
        [self.navigationController pushViewController:tongjiVC animated:YES];
    }else if (indexPath.row == 23) {
        //生命周期
        View1Controller* VC11 = [mainStoryboard instantiateViewControllerWithIdentifier:@"VC11"];
        [self.navigationController pushViewController:VC11 animated:YES];
    }else if (indexPath.row == 24) {
        //动画
        DonghuaViewController* donghuaVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"donghuaVC"];
        [self.navigationController pushViewController:donghuaVC animated:YES];
    }else if (indexPath.row == 25) {
        //scrollview
        TestScrollViewViewController* testScrollViewVC = [TestScrollViewViewController new];
        [self.navigationController pushViewController:testScrollViewVC animated:YES];
    }else if (indexPath.row == 26) {
        //sqlite
        TestSqliteViewController* testSqliteVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"testSqliteVC"];
        [self.navigationController pushViewController:testSqliteVC animated:YES];
    }else if (indexPath.row == 27) {
        //sqlite
        SearchSqliteViewController* searchSqliteVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"searchSqliteVC"];
        [self.navigationController pushViewController:searchSqliteVC animated:YES];
    }else if (indexPath.row == 28) {
        //alipay
        AlipayViewController* alipayVC = [mainStoryboard instantiateViewControllerWithIdentifier:@"alipayVC"];
        [self.navigationController pushViewController:alipayVC animated:YES];
    }
}

@end
