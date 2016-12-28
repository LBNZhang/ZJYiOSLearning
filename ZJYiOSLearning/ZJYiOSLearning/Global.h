//
//  Global.h
//  3DTouchTest1010
//
//  Created by 张靖尧 on 16/10/10.
//  Copyright © 2016年 曾威林. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "ViewController.h"
#import "TuiSongViewController.h"
#import "TongZhiViewController.h"
#import "DTouchViewController.h"
#import "FenXiangViewController.h"
#import "MainTableViewController.h"
#import "WenJianCaoZuoTableViewController.h"
#import "GuiDangTableViewController.h"
#import "NSFileManagerTableViewController.h"
#import "PListTableViewController.h"
#import "NSUserDefaultsTableViewController.h"
#import "WaterImgViewController.h"
#import "NetworkRequestViewController.h"
#import "BlockViewController.h"
#import "Block2ViewController.h"
#import "SaoMaViewController.h"
#import "CIImage+CreateUIImage.h"
#import "SaoMa2ViewController.h"
#import "ZJYTabBarViewController.h"
#import "ZJYTabBarView.h"
#import "ZJYTabBarButton.h"
#import "Tab1ViewController.h"
#import "Tab2ViewController.h"
#import "TiaoZhuanViewController.h"
#import "NSTimerViewController.h"
#import "GCDViewController.h"
#import "GCD1ViewController.h"
#import "DuiXiangCunQuTableViewController.h"
#import "XuLieHua.h"
#import "Student.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "BlockTestViewController.h"
#import "NotificationChuanZhiViewController.h"
#import "BViewController.h"
#import "WebViewWangYeViewController.h"
#import "ChongYongCellTableViewController.h"
#import "ChongYongTableViewCell.h"
#import "HongBaoViewController.h"
#import "HongBaoView.h"
#import "BendihuaViewController.h"
#import "StudentModel.h"
#import "TongJiViewController.h"
#import "View1Controller.h"
#import "View2Controller.h"
#import "View3Controller.h"
#import "UIViewController+Swizzling.h"
#import "DonghuaViewController.h"
#import "AFNetworkingViewController.h"
#import "TestScrollViewViewController.h"
#import "MTableViewCell.h"
#import "TestSqliteViewController.h"
#import "SearchSqliteViewController.h"
#import <sqlite3.h>
#import <AlipaySDK/AlipaySDK.h>
#import "AlipayViewController.h"
#import "Order.h"

@interface Global : NSObject

extern sqlite3 *db;

extern NSInteger startAppType;
extern UIStoryboard* mainStoryboard;

extern Boolean hasAddToCollectionOrNot;
extern Boolean hasLoginedOrNot;

+ (void) setupGlobalVariable;
//获取工程中当前所显示页面的navigationcontroller页面
+ (UINavigationController*) getLastNavigationController;
//获取当前页面
+ (UIViewController*) getCurrentViewController;
@end
