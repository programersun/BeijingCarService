//
//  NoticeViewController.swift
//  BeijingCarService
//
//  Created by 孙瑞 on 15/8/10.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import UIKit

class NoticeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "通知公告"
        // Do any additional setup after loading the view.
    }

    @IBAction func logOutBtnClick(sender: AnyObject) {
        SR_UserInfoDetail.sharedInstance.logoutUser()
        var storyBoard = UIStoryboard(name: "Login", bundle: nil)
        var loginVC  = storyBoard.instantiateInitialViewController() as! LoginViewController
        self.view.window?.rootViewController = loginVC
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
