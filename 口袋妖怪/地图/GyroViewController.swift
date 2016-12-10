//
//  GyroViewController.swift
//  定位
//
//  Created by 梁亚宾 on 16/7/28.
//  Copyright © 2016年 liang. All rights reserved.
//

import UIKit
import CoreLocation
import CoreMotion
class GyroViewController: UIViewController {

    //左右
    var locationM: CLLocationManager!
    //上下
    var mgr: CMMotionManager!
    
    var image: UIImageView!
    
    var mask: UIView!
    
    var i: CGFloat = 0
    
    var chongwuBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///初始化相机
        let cameraView = CameraView()
        cameraView.frame = view.bounds
        view.addSubview(cameraView)
        
        
        mask = UIView(frame: view.bounds)
        view.addSubview(mask)
        
        ///图像
        image = UIImageView(image: UIImage(named: "1"))
        image.frame.size = CGSize(width: 200, height: 200)
        image.center = mask.center
        mask.addSubview(image)
        ///名字
        // 设置名字
        let nameLabel = UILabel(frame: CGRect(x: 0, y: 0 , width: 200, height: 50))
        nameLabel.center = CGPoint(x: image.center.x, y: image.center.y-130)
        nameLabel.textAlignment = NSTextAlignment.Center
        nameLabel.backgroundColor = UIColor(white: 0, alpha: 0.2)
        nameLabel.font = UIFont(name: "", size: 20)
        nameLabel.textColor = UIColor(white: 1, alpha: 1)
        nameLabel.text = "皮卡丘    /    CP31"
        nameLabel.layer.cornerRadius = 25
        nameLabel.clipsToBounds = true

        
        mask.userInteractionEnabled = false
        mask.addSubview(nameLabel)
        //按钮
        chongwuBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        chongwuBtn.center = CGPoint(x: view.bounds.width/2, y: view.bounds.height-100)
//        chongwuBtn.addTarget(self, action: #selector(lick), forControlEvents: UIControlEvents.TouchUpInside)
        chongwuBtn.setImage(UIImage(named: "11111"), forState: UIControlState.Normal)
        chongwuBtn.userInteractionEnabled = false
        view.addSubview(chongwuBtn)
        
        //初始化指南针位置
        locationM = CLLocationManager()
        locationM.delegate = self
        locationM.startUpdatingHeading()//开始获得航向数据 ///开始更新 左右
        
        
        updata()///初始化上下
        
    }
    
}

extension GyroViewController: CLLocationManagerDelegate {
    
    // 已经更新到用户设备朝向时调用 左右定位
    func locationManager(manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
        // magneticHeading : 距离磁北方向的角度
        // trueHeading : 北方
        // headingAccuracy : 如果是负数,代表当前设备定位错误
        //        if newHeading.headingAccuracy < 0 {return}
        ///角度
        let angle =  CGFloat (newHeading.magneticHeading)
        
        let x = -9*(angle)+view.center.x + 500
        
        if x < -200 || x > ScreenW+200 {//防止闪烁
            self.mask.center.x = x
            return
        }
        
        
        // 反向旋转图片(弧度)
        UIView.animateWithDuration(0.3) {
            self.mask.center.x = x
        }
        
        print(mask.center.x)

    }
    
    
    func updata(){
        //----------------------------上下定位
        mgr = CMMotionManager()
        ///获取加速度
        mgr.accelerometerUpdateInterval = 1/20
        weak var weakSelf = self
        mgr.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue()) { (cma:CMAccelerometerData?, error:NSError?) in
            
            
            let y = UIScreen.mainScreen().bounds.height / 2 + (UIScreen.mainScreen().bounds.height-100) * CGFloat(cma!.acceleration.z)
            ///不抖动
            if y > weakSelf!.i+8 || y < weakSelf!.i-8 {
                
                UIView.animateWithDuration(0.3) {
                    weakSelf!.mask.center.y = y + 300// 向下移动，感觉在地上
                }
                weakSelf!.i = y
                
            }
            
        }
    }
    
    
    
    
    
    ///手指移动调用
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch:UITouch in touches {
            chongwuBtn.center = touch.locationInView(view)
        }
    }
    //手指抬起
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 20, options: UIViewAnimationOptions.AllowAnimatedContent, animations: {
            self.chongwuBtn.center = CGPoint(x: ScreenW/2, y: ScreenH-100)
        }) { (_) in
            
        }
    }
    
    
    
}
