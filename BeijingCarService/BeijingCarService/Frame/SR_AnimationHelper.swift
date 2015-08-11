//
//  SR_AnimationHelper.swift
//  BeijingCarService
//
//  Created by 瑞孙 on 15/7/1.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import UIKit

class SR_AnimationHelper: CAAnimation {
    
    typealias SR_AnimationHelperComplete = (isFinish  : Bool) -> Void
    
    /**
    循环渐隐效果
    
    :returns: 返回动画
    */
    
    private var completeBlock : SR_AnimationHelperComplete?
    class func animationHelperAlpha() -> CABasicAnimation
    {
        var animationAdd = CABasicAnimation(keyPath: "opacity")
        animationAdd.fromValue = 0.5
        animationAdd.toValue   = 1
        animationAdd.duration  = 0.5
        animationAdd.repeatCount = 1e100
        animationAdd.autoreverses = true
        animationAdd.removedOnCompletion = false;
        animationAdd.fillMode = kCAFillModeForwards;
        animationAdd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animationAdd
    }
    
    /**
    透明度过度动画
    
    :param: from 开始值
    :param: to   结束值
    
    :returns: 返回动画效果
    */
    class func animationForAlpha(from: Double , to : Double) -> CABasicAnimation
    {
        var animationAdd = CABasicAnimation(keyPath: "opacity")
        animationAdd.fromValue = from
        animationAdd.toValue   = to
        animationAdd.duration  = 0.5
        animationAdd.repeatCount = 1
        animationAdd.removedOnCompletion = true;
        animationAdd.fillMode = kCAFillModeForwards;
        animationAdd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        return animationAdd
        
    }
    
    func animationForAlpha(from: Double , to : Double , finishBlock : SR_AnimationHelperComplete?) -> CABasicAnimation
    {
        var animationAdd = CABasicAnimation(keyPath: "opacity")
        animationAdd.fromValue = from
        animationAdd.toValue   = to
        animationAdd.duration  = 0.2
        animationAdd.repeatCount = 1
        animationAdd.removedOnCompletion = true;
        animationAdd.fillMode = kCAFillModeForwards;
        animationAdd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        if(finishBlock != nil)
        {
            var delayTime = Int64(NSEC_PER_SEC / 5)
            var t = dispatch_time(DISPATCH_TIME_NOW, delayTime)
            dispatch_after(t, dispatch_get_main_queue(), { [weak self]() -> Void in
                finishBlock!(isFinish: true)
                ""
                })
            
        }
        
        return animationAdd
    }
    
    func animationForAlphaForWait(from: Double , to : Double , finishBlock : SR_AnimationHelperComplete?) -> CABasicAnimation
    {
        var animationAdd = CABasicAnimation(keyPath: "opacity")
        animationAdd.fromValue = from
        animationAdd.toValue   = to
        animationAdd.duration  = 0.5
        animationAdd.repeatCount = 1
        animationAdd.removedOnCompletion = true;
        animationAdd.fillMode = kCAFillModeForwards;
        animationAdd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        if(finishBlock != nil)
        {
            var delayTime = Int64(NSEC_PER_SEC / 2)
            var t = dispatch_time(DISPATCH_TIME_NOW, delayTime)
            dispatch_after(t, dispatch_get_main_queue(), { [weak self]() -> Void in
                finishBlock!(isFinish: true)
                ""
                })
            
        }
        
        return animationAdd
    }
    
    
    /**
    大小动画
    
    :returns: 返回动画
    */
    class func animationHelperSize() -> CABasicAnimation
    {
        var animationAdd = CABasicAnimation(keyPath: "transform.scale")
        animationAdd.fromValue = 0
        animationAdd.toValue   = 1
        animationAdd.duration  = 0.2
        animationAdd.repeatCount = 1
        //animationAdd.autoreverses = true
        animationAdd.removedOnCompletion = true;
        animationAdd.fillMode = kCAFillModeForwards;
        animationAdd.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        return animationAdd
        
    }
    
    /**
    旋转动画
    
    :returns: 返回动画
    */
    class func animationRotation() -> CABasicAnimation
    {
        var rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.toValue = M_PI * 2
        rotationAnimation.duration = 1
        rotationAnimation.cumulative  = true
        rotationAnimation.repeatCount = 1e100
        //rotationAnimation.autoreverses = true
        return rotationAnimation
    }
    
    
    
    override func animationDidStart(anim: CAAnimation!) {
        
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if(flag)
        {
            
        }
    }
}
