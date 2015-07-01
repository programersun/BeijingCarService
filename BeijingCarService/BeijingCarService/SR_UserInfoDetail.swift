//
//  SR_UserInfoDetail.swift
//  BeijingCarService
//
//  Created by 瑞孙 on 15/7/1.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import Foundation
import UIKit
let USERIDKEY : String      = "UserInfoDetail_UserId" //用户id
let USERPASSKEY : String    = "UserInfoDetail_UserPass" //无用 用户密码
let APPFIRSTLOADKEY:String  = "UserInfoDetail_Load" //应用使用的标志位
let RELOGINFLAG : String    = "UserReloginMethod" //需要用户重新登录
let USERSESSION             = "UserInfoDetail_UserSession"//用户session

let _SR_UserInfoDetailInstance = SR_UserInfoDetail()
class SR_UserInfoDetail {
    //单例模式
    class var sharedInstance: SR_UserInfoDetail {
        return _SR_UserInfoDetailInstance
    }
    
    /**
    保存用户id
    
    :param: userID 用户id
    */
    func saveUserID(userID:String)
    {
        //如果传进"" 将系统的用户id 设为nil
        if userID.isEmpty
        {
            NSUserDefaults.standardUserDefaults().setValue(nil, forKey: USERIDKEY)
            return
        }
        NSUserDefaults.standardUserDefaults().setValue(userID, forKey: USERIDKEY)
    }
    
    // 需要重新登录
    func saveReloginFlag(mark : String)
    {
        NSUserDefaults.standardUserDefaults().setValue(mark, forKey: RELOGINFLAG)
    }
    
    // 不需要重新登录了
    func resetLoginMark()
    {
        NSUserDefaults.standardUserDefaults().setValue(nil, forKey: RELOGINFLAG)
    }
    
    func isUserNeedLogin() -> Bool
    {
        var userID:String? = NSUserDefaults.standardUserDefaults().valueForKey(RELOGINFLAG) as? String
        if userID != nil
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    //判断用户有没有登陆
    func isUserLogin()->Bool
    {
        //根据用户id 判断用户是否登陆
        var userID:String? = NSUserDefaults.standardUserDefaults().valueForKey(USERIDKEY) as? String
        if(userID == nil)
        {
            return false
        }
        return true
    }
    
    //获取用户id
    func getUserID() -> String?
    {
        var userID: String? = NSUserDefaults.standardUserDefaults().valueForKey(USERIDKEY) as? String
        return userID
    }
    
    //获取用户sessionID
    func getUserSession() -> String?
    {
        var userSession = NSUserDefaults.standardUserDefaults().valueForKey(USERSESSION) as? String
        return userSession
    }
    
    //设置用户sessionID
    func setUserSession(sessionID : String?)
    {
        NSUserDefaults.standardUserDefaults().setValue(sessionID, forKey: USERSESSION)
    }
    
    //判断app是否为第一次使用
    func isAppFirstLoad() -> Bool
    {
        var appKey:String? = NSUserDefaults.standardUserDefaults().valueForKey(APPFIRSTLOADKEY) as? String
        if(appKey == nil)
        {
            //NSUserDefaults.standardUserDefaults().setValue("already install", forKey: APPFIRSTLOADKEY)
            return true
        }
        else
        {
            return false
        }
    }
    
    //判断app第一次运行加载数据是否成功
    func startFirstSuccess() -> Void
    {
        var appKey:String? = NSUserDefaults.standardUserDefaults().valueForKey(APPFIRSTLOADKEY) as? String
        NSUserDefaults.standardUserDefaults().setValue("already install", forKey: APPFIRSTLOADKEY)
    }
    
    //获取用户密码
    func getUserPass() -> String
    {
        var userPass:String? = NSUserDefaults.standardUserDefaults().valueForKey(USERPASSKEY) as? String
        return userPass!
    }

    func logoutUser()
    {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(USERIDKEY)
        NSUserDefaults.standardUserDefaults().removeObjectForKey(USERPASSKEY)
        NSUserDefaults.standardUserDefaults().removeObjectForKey(USERSESSION)
    }

}