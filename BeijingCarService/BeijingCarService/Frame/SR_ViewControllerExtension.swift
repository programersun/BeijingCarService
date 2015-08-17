//
//  SR_ViewControllerExtension.swift
//  BeijingCarService
//
//  Created by 瑞孙 on 15/7/1.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController : UIAlertViewDelegate {

    /**
    设置导航栏左侧按钮的图片
    
    :param: imageName 图片名称
    */
    func setNaviBarLeftImage(imageName:String)->Void
    {
        var currentLeftImage:UIImage!          = UIImage(named: imageName)
        //生成导航栏左侧按钮
        var leftBtn         :UIButton          = UIButton(frame: CGRectMake(0, 0, 50, 30))
        leftBtn.addTarget(self, action: "leftNaviButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        leftBtn.setImage(currentLeftImage, forState: UIControlState.Normal)
        //需要展位按钮
        var leftSpace       :UIBarButtonItem   = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        leftSpace.width                        = -15
        //使用自定义button代替左侧按钮
        var leftItem        :UIBarButtonItem   = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItems = [leftSpace,leftItem]
    }
    
    /**
    拨打电话
    */
    func callPhone()
    {
        var alert = UIAlertView(title: "提示", message: "是否要拨打电话400-000-0080", delegate: self, cancelButtonTitle: "取消", otherButtonTitles: "确定")
        alert.show()
    }
    
    public func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1
        {
            var url1 = NSURL(string: "tel://4000000080")
            UIApplication.sharedApplication().openURL(url1!)
        }
    }
    
    /**
    设置导航栏右侧按钮的图片
    
    :param: imageName 图片名称
    */
    func setNaviBarRightImage(imageName:String)->Void
    {
        var currentRightImage:UIImage!         = UIImage(named: imageName)
        var rightBtn         :UIButton         = UIButton(frame: CGRectMake(0, 0, 50, 30))
        rightBtn.addTarget(self, action: "rightNaviButtonAction", forControlEvents: UIControlEvents.TouchUpInside)
        rightBtn.setImage(currentRightImage, forState: UIControlState.Normal)
        var rightSpace       :UIBarButtonItem  = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FixedSpace, target: nil, action: nil)
        rightSpace.width                       = -15
        var rightItem        :UIBarButtonItem  = UIBarButtonItem(customView: rightBtn)
        self.navigationItem.rightBarButtonItems = [rightSpace,rightItem]
    }
    
    /**
    左侧按钮的事件
    */
    func leftNaviButtonAction()
    {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    /**
    右侧按钮点击事件，子类复写
    */
    func rightNaviButtonAction()
    {
        
    }

    /**
    跳转到登录界面
    */
    func toLoginVC() {
        var storyBoard = UIStoryboard(name: "Login", bundle: nil)
        var vc = storyBoard.instantiateInitialViewController() as! LoginViewController
        self.view.window?.rootViewController = vc
    }
    
//    #define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
//    #define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
//    #define HEIGHTCHANGE SCREENWIDTH/320
    func screenHeight() -> CGFloat{
        return UIScreen.mainScreen().bounds.size.height
    }
    
    func screenWidth() -> CGFloat{
        return UIScreen.mainScreen().bounds.size.width
    }
    
    func screenHeightChange() -> CGFloat{
        return self.screenWidth()/320
    }
    
    /**
    跳转到登录界面
    */
    func changeFrame(sender: UIView) {
        sender.frame = CGRectMake(sender.frame.origin.x * self.screenHeightChange(), sender.frame.origin.y * self.screenHeightChange(),sender.frame.size.width * self.screenHeightChange(), sender.frame.size.height * self.screenHeightChange())
    }

}