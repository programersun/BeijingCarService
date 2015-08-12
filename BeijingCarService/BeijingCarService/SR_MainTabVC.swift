//
//  SR_MainTabVC.swift
//  BeijingCarService
//
//  Created by 瑞孙 on 15/7/1.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import UIKit
/**
*  mainTabBar视图的控制器
*/

class SR_MainTabVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var firstNavi = UIStoryboard(name: String.StoryForString(StoryNameType.StoryNameFirst), bundle: nil).instantiateInitialViewController() as! UINavigationController
        var secondNavi = UIStoryboard(name: String.StoryForString(StoryNameType.StoryNameSecond), bundle: nil).instantiateInitialViewController() as! UINavigationController
        var thirdNavi = UIStoryboard(name: String.StoryForString(StoryNameType.StoryNameThird), bundle: nil).instantiateInitialViewController() as! UINavigationController
        var fourthNavi = UIStoryboard(name: String.StoryForString(StoryNameType.StoryNameFourth), bundle: nil).instantiateInitialViewController() as! UINavigationController
        var fifthNavi = UIStoryboard(name: String.StoryForString(StoryNameType.StoryNameFifth), bundle: nil).instantiateInitialViewController() as! UINavigationController
        
        // MARK:打开此处跑通登陆注册功能
        self.delegate = self
        self.setViewControllers([firstNavi , secondNavi , thirdNavi , fourthNavi, fifthNavi], animated: false)
        
        self.tabBar.tintColor = UIColor.MainYellowColor()
        self.tabBar.barTintColor = UIColor(red: 240/255.0, green: 240/255.0, blue: 240/255.0, alpha: 1)
        self.tabBar.backgroundColor = UIColor.whiteColor()
        
        UIActionSheet.appearance().tintColor = UIColor.redColor()
//        self.tabBar.selectedImageTintColor = UIColor.blackColor()

            /**
            *  初始化tabbar item 的视图样式
            *
            *  @param index item的索引
            *  @param value item的值
            *
            *  @return 无返回
            */
        
        for (index , value) in enumerate(self.tabBar.items as! [UITabBarItem])
        {
            var itemForImgAndTitle = value as UITabBarItem
            var info = String.itemSelectImgString(index)
            
            //设置item的普通图片、选中的图片、以及对应标题的颜色
            itemForImgAndTitle.selectedImage = UIImage(named: info.selectImg)
            itemForImgAndTitle.image         = UIImage(named: info.image)
            itemForImgAndTitle.title         = info.titleString
            itemForImgAndTitle.setTitleTextAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(13) , NSForegroundColorAttributeName : UIColor.grayColor()], forState: UIControlState.Normal)
            
            itemForImgAndTitle.setTitleTextAttributes([NSFontAttributeName : UIFont.boldSystemFontOfSize(13) , NSForegroundColorAttributeName : UIColor.MainYellowColor()], forState: UIControlState.Selected)
        }

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension SR_MainTabVC : UITabBarControllerDelegate {

}
