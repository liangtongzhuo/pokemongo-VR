//
//  ViewController.swift
//  地图
//
//  Created by 梁亚宾 on 16/7/28.
//  Copyright © 2016年 liang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    var gyroViewController: UIViewController!
    var mapViewController: MapViewController!
    
    var btn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///陀螺仪控制器
        gyroViewController = GyroViewController()
        addChildViewController(gyroViewController)
        view.addSubview(gyroViewController.view)
        gyroViewController.view.alpha = 0
        
        //map
        mapViewController = MapViewController()
        addChildViewController(mapViewController)
        view.addSubview(mapViewController.view)
        
        
        btn = UIButton(frame: CGRect(x: 0, y: view.bounds.height-50, width: 100, height: 50))
        btn.setTitle("切换界面", forState: UIControlState.Normal)
        btn.addTarget(self, action: #selector(lick), forControlEvents: UIControlEvents.TouchUpInside)
        
        view.addSubview(btn)
        
        
  
    }
    
    func lick(){
        
        if gyroViewController.view.alpha == 0 {
           UIView.animateWithDuration(1, animations: { 
            self.gyroViewController.view.alpha = 1
            self.mapViewController.view.alpha = 0
           })
        }else{
            UIView.animateWithDuration(1, animations: {
                self.gyroViewController.view.alpha = 0
                self.mapViewController.view.alpha = 1
            })
        }
        
    }

    
}

