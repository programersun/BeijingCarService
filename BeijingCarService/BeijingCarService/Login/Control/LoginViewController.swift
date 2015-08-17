//
//  LoginViewController.swift
//  BeijingCarService
//
//  Created by 孙瑞 on 15/8/14.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginTopImg: UIImageView!
    
    @IBOutlet weak var loginButtomView: UIView!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var loginButtomImg: UIImageView!
    @IBOutlet weak var accountText: UITextField!
    @IBOutlet weak var PasswordText: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var ForgetPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loginButtomView.frame = CGRectMake(0, self.screenHeight() - self.loginButtomView.frame.size.height * self.screenHeightChange(), self.loginButtomView.frame.size.width * self.screenHeightChange(), self.loginButtomView.frame.size.height * self.screenHeightChange())
        self.loginTopImg.frame = CGRectMake(0, 0, self.screenWidth(), self.screenHeight())

        self.accountText.delegate = self
        self.PasswordText.delegate = self
        self.accountText.font = UIFont.boldSystemFontOfSize(17 * self.screenHeightChange())
        self.PasswordText.font = UIFont.boldSystemFontOfSize(17 * self.screenHeightChange())
        self.accountText.setValue(UIColor.PlaceholderYellowColor(), forKeyPath: "_placeholderLabel.textColor")
        self.PasswordText.setValue(UIColor.PlaceholderYellowColor(), forKeyPath: "_placeholderLabel.textColor")
        
        self.changeFrame(self.logoImg)
        self.changeFrame(self.loginButtomImg)
        self.changeFrame(self.loginBtn)
        self.changeFrame(self.ForgetPasswordBtn)
        self.changeFrame(self.accountText)
        self.changeFrame(self.PasswordText)
        
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
        
        var tapButtom = UITapGestureRecognizer(target: self, action: Selector("backgroundImgTap"))
        self.view.addGestureRecognizer(tapButtom)
    }
    
    func backgroundImgTap() {

        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.view.frame = CGRectMake(0, 0, self.screenWidth(), self.screenHeight())
        }) { (Bool) -> Void in
            self.accountText.resignFirstResponder()
            self.PasswordText.resignFirstResponder()
        }
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

extension LoginViewController : UITextFieldDelegate {
    func textFieldDidBeginEditing(textField: UITextField) {
        UIView.animateWithDuration(0.5, animations: { () -> Void in
            self.view.frame = CGRectMake(0, -50, self.screenWidth(), self.screenHeight())
            
        })
        
    }
}
