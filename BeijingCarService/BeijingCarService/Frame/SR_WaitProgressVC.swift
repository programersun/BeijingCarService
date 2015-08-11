//
//  SR_WaitProgressVC.swift
//  BeijingCarService
//
//  Created by 瑞孙 on 15/7/1.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import UIKit

/**
*  网络下载的提示页面
*/
class SR_WaitProgressVC: UIView {
    /// 背景view
    private  var circleV : UIView!
    //背景image
    private  var circleImg : UIImageView!
    private  lazy var thisAlpha : Float! = 0.4
    /**
    加载页面并旋转
    
    :param: superV 父类view
    */
    func startProgress(superV : UIView)
    {
        weak var superVW = UIApplication.sharedApplication().keyWindow?.rootViewController?.view
        if superVW == nil
        {
            return
        }
        for v in superVW!.subviews
        {
            if v as! UIView == self
            {
                return
            }
        }
        self.frame = superVW!.bounds
        self.layer.opacity = thisAlpha
        self.layer.allowsGroupOpacity = false
        self.layer.backgroundColor = UIColor.grayColor().CGColor
        superVW!.addSubview(self)
        superVW!.bringSubviewToFront(self)
        if self.layer.animationForKey("alpha") == nil
        {
            self.layer.addAnimation(SR_AnimationHelper.animationForAlpha(0, to: Double(thisAlpha)), forKey: "alpha")
        }
        if let circle = circleV
        {
            self.addSubview(circle)
            
        }
        else
        {
            self.rotationView()
            self.addSubview(circleV)
        }
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: circleV, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.addConstraint(NSLayoutConstraint(item: self, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: circleV, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 50))
        circleV.addConstraint(NSLayoutConstraint(item: circleV, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 100))
        circleV.addConstraint(NSLayoutConstraint(item: circleV, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 80))
        self.startAnimation()
    }
    
    /**
    隐藏
    
    :param: superV 父类
    */
    func hideProgress(superV : UIView)
    {
        var finishAni = SR_AnimationHelper()
        self.layer.opacity = 0
        self.layer.addAnimation(finishAni.animationForAlphaForWait(Double(thisAlpha), to: 0, finishBlock: { [weak self](isFinish) -> Void in
            if let he = self{
                self!.removeFromSuperview()
            }
            }), forKey: "alphaN")
        
        
    }
    
    private func rotationView()
    {
        circleV = UIView(frame: CGRectMake(0, 0, 100, 80))
        circleV.backgroundColor = UIColor.clearColor()
        circleV.layer.cornerRadius = 5
        circleV.layer.borderWidth  = 1
        circleV.layer.borderColor  = UIColor.clearColor().CGColor
        circleImg = UIImageView(image: UIImage(named: "indicator"))
        circleV.addSubview(circleImg)
        circleV.setTranslatesAutoresizingMaskIntoConstraints(false)
        circleImg.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        circleV.addConstraint(NSLayoutConstraint(item: circleV, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: circleImg, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        
        circleV.addConstraint(NSLayoutConstraint(item: circleV, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: circleImg, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        
        circleImg.addConstraint(NSLayoutConstraint(item: circleImg, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 40))
        
        circleImg.addConstraint(NSLayoutConstraint(item: circleImg, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 40))
        
    }
    
    private func startAnimation()
    {
        if(circleImg.layer.animationForKey("rota") != nil)
        {
            return
        }
        circleImg.layer.addAnimation(SR_AnimationHelper.animationRotation(), forKey: "haha")
    }
    
}

