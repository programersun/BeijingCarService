//
//  LoginViewController.swift
//  BeijingCarService
//
//  Created by 孙瑞 on 15/8/14.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var ForgetPasswordBtn: UIButton!
    @IBOutlet weak var accountText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var img = UIImage(named: "LoginBackground")
        var imgHeight = img?.size.height
        var imgWidth  = img?.size.width
        
        self.backgroundImg.image = img
        self.mainScrollView.frame = CGRectMake(0, 0, self.screenWidth(), self.screenHeight())
        
        self.changeFrame(self.backgroundImg)
        self.changeFrame(self.loginBtn)
        self.changeFrame(self.ForgetPasswordBtn)
        self.changeFrame(self.accountText)
        self.changeFrame(self.PasswordText)
        
        self.mainScrollView.contentSize = CGSizeMake(self.screenWidth() , self.backgroundImg.frame.size.height)
        self.addTouch()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnClick(sender: AnyObject) {
        
        self.loginAction()
    }
    
    @IBAction func forgetPasswordBtnClick(sender: AnyObject) {
        
    }
    
    //给背景添加请出时间，撤出键盘
    func addTouch() {
        var tap = UITapGestureRecognizer(target: self, action: Selector("backgroundImgTap"))
        self.backgroundImg.addGestureRecognizer(tap)
    }
    
    func backgroundImgTap() {
        self.accountText.resignFirstResponder()
        self.PasswordText.resignFirstResponder()
    }
    
    //登录
    func loginAction()
    {
        SR_UserInfoDetail.sharedInstance.saveUserID("123")
        var storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var mainTabVC  = storyBoard.instantiateInitialViewController() as! SR_MainTabVC
        self.view.window?.rootViewController = mainTabVC
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
