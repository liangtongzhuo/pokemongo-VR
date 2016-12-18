//
//  comman.swift
//  tongrenyinsheng
//
//  Created by 梁亚宾 on 16/3/4.
//  Copyright © 2016年 liang. All rights reserved.
//

import UIKit
  //记录是否进入后台
  var isbackground: Bool = false
  //设置全局 颜色
  let commanColor = UIColor(colorLiteralRed: 0/255, green: 175.0/255, blue: 240.0/255, alpha: 1)
  let commanBlack = UIColor(colorLiteralRed: 30/255, green: 30/255, blue: 30/255, alpha: 1)
  let commabGray =  UIColor(colorLiteralRed: 33/255, green: 34/255, blue: 36/255, alpha: 1)



  ///屏幕 高度
  let ScreenH = UIScreen.main.bounds.height
  ///屏幕 宽度
  let ScreenW = UIScreen.main.bounds.width

  ///判断是否是6p
  let iPhone6Push:Bool = UIScreen.main.bounds.width == 414 ?  true : false
  ///判断是否是6
  let iPhone6:Bool = UIScreen.main.bounds.width == 375 ?  true : false
  ///判断是否是5s 5e 4s
  let iPhone5s5e4s = iPhone6 != true && iPhone6Push != true ? true : false
   ///判断是否是4s
  let iPhone4s = UIScreen.main.bounds.height == 480 ? true : false







