//
//  SR_ColorExtension.swift
//  BeijingCarService
//
//  Created by 瑞孙 on 15/7/1.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import Foundation
import UIKit
extension UIColor{

    /**
    项目主要使用橙色
    
    :returns: 应用于 TabBar title
    */
    class func MainYellowColor() -> UIColor
    {
        return UIColor(red: 246 / 255.0, green: 59 / 255.0, blue: 10 / 255.0, alpha: 1)
    }
    
    /**
    Placeholder使用橙色
    
    :returns: 应用于 Placeholder
    */
    class func PlaceholderYellowColor() -> UIColor
    {
        return UIColor(red: 203 / 255.0, green: 138 / 255.0, blue: 106 / 255.0, alpha: 1)
    }
    
    /**
    TabBar被选中的颜色
    
    :returns: 应用于 TabBar 背景
    */
    class func TabBarSelectColor() -> UIColor
    {
        return UIColor(red: 121 / 255.0, green: 18 / 255.0, blue: 5 / 255.0, alpha: 1)
    }
    
}