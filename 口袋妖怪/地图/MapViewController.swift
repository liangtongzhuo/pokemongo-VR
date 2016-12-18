//
//  MapViewController.swift
//  定位
//
//  Created by 梁亚宾 on 16/7/28.
//  Copyright © 2016年 liang. All rights reserved.
//

import UIKit

class MapViewController: UIViewController ,BMKMapViewDelegate ,BMKLocationServiceDelegate{
    
    var mapView: BMKMapView!
    //定位
    var locationService: BMKLocationService!
    
    var button: UIButton!
    
    
    //自定义地图样式
    func customMapStyle() {
        //设置自定义地图样式，会影响所有地图实例
        //注：必须在BMKMapView对象初始化之前调用
        let path = Bundle.main.path(forResource: "custom_config_清新蓝", ofType: "")//个性化地图样式文件路径
        BMKMapView.customMapStyle(path)
        BMKMapView.enableCustomMapStyle(false)//默认关闭
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button = UIButton(frame: CGRect(x: view.bounds.width-50, y: view.bounds.height-50, width: 50, height: 50))
        button.setTitle("定位", for: UIControlState())
        button.addTarget(self, action: #selector(click), for: UIControlEvents.touchUpInside)
        
        ///自定义设置
        customMapStyle()
        BMKMapView.enableCustomMapStyle(true)//开启自定义
        
        var frame = view.bounds
        frame.size.height = frame.size.height+50//隐藏logo
        mapView = BMKMapView(frame: frame)
        mapView.showMapPoi = false//地图标注
        mapView.isBuildingsEnabled = true//3d楼宇
        mapView.zoomLevel = 21//地图大小
        mapView.compassPosition = CGPoint(x: 300, y: 300)//隐藏指南针
        
        
        
        //自定义精度圈
//        let param = BMKLocationViewDisplayParam()
//                param.accuracyCircleStrokeColor = commanColor
//                param.accuracyCircleFillColor = commanColor
//        mapView.updateLocationViewWithParam(param)
        
        
        locationService = BMKLocationService()
        locationService.allowsBackgroundLocationUpdates = true
        
        
        view.addSubview(mapView)
        mapView.delegate = self
        
        view.addSubview(button)
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationService.delegate = self
        mapView.delegate = self
        mapView.viewWillAppear()
        
        click()
    }
    ///点击
    func click(){
        locationService.startUserLocationService()
        mapView.showsUserLocation = false//先关闭显示的定位图层
        mapView.userTrackingMode = BMKUserTrackingModeNone//设置定位的状态
        mapView.showsUserLocation = true//显示定位图层
        mapView.userTrackingMode = BMKUserTrackingModeFollow//开始定位
        mapView.userTrackingMode = BMKUserTrackingModeFollowWithHeading//开始罗盘
        
    }
    
    /**
     *用户方向更新后，会调用此函数
     *@param userLocation 新的用户位置
     */
    func didUpdateUserHeading(_ userLocation: BMKUserLocation!) {
        print("heading is \(userLocation.heading)")
        mapView.updateLocationData(userLocation)
    }
    
    /**
     *用户位置更新后，会调用此函数
     *@param userLocation 新的用户位置
     */
    func didUpdate(_ userLocation: BMKUserLocation!) {
        print("didUpdateUserLocation lat:\(userLocation.location.coordinate.latitude) lon:\(userLocation.location.coordinate.longitude)")
        mapView.updateLocationData(userLocation)
    }
    
    func didFailToLocateUserWithError(_ error: Error!) {
        print(error)
    }
}
