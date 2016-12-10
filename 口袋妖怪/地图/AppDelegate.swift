//
//  AppDelegate.swift
//  地图
//
//  Created by 梁亚宾 on 16/7/28.
//  Copyright © 2016年 liang. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,BMKGeneralDelegate {

    var window: UIWindow?
    var _mapManager: BMKMapManager?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // 要使用百度地图，请先启动BaiduMapManager
        _mapManager = BMKMapManager()
        // 如果要关注网络及授权验证事件，请设定generalDelegate参数
        let ret = _mapManager?.start("XkGN2cWCVGYMgGl6hT1bCQcOQf8HUe6F", generalDelegate: self)
        if ret == false {
            NSLog("manager start failed!")
        }
        return true
    }

    //MARK: - BMKGeneralDelegate
    func onGetNetworkState(iError: Int32) {
        if (0 == iError) {
            NSLog("联网成功");
        }
        else{
            NSLog("联网失败，错误代码：Error\(iError)");
        }
    }
    
    func onGetPermissionState(iError: Int32) {
        if (0 == iError) {
            NSLog("授权成功");
        }
        else{
            NSLog("授权失败，错误代码：Error\(iError)");
        }
    }

}

