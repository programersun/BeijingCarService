//
//  SR_NetOperate.swift
//  SR_NetOperate
//
//  Created by 瑞孙 on 15/3/5.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import UIKit

let _SR_NetInstance = SR_NetOperate()

class SR_NetOperate: NSObject {
    class var sharedInstance:SR_NetOperate {
        return _SR_NetInstance
    }
    
    /**
    判断网络连接状态
    
    :param: statusBlock 当连接状态改变的时候将 状态码传递
    */
    func judgeNetCanConnect(currentStatus statusBlock: ((status : AFNetworkReachabilityStatus)->Void)?) -> Void {
        var net : AFNetworkReachabilityManager = AFNetworkReachabilityManager.sharedManager()
        net.startMonitoring()
        net.setReachabilityStatusChangeBlock(statusBlock)
    }
    
    /**
    网络请求连接
    
    :param: urlString 数据连接请求API
    :param: parameter 数据请求参数
    :param: success   数据连接成功的时候的回调函数
    :param: errors    数据连接失败的时候的回调函数
    */
    
    func startRequestNetWorking(type : String ,urlString: String , parameter: Dictionary<String , AnyObject >? , successBlock success:((returnDic : Dictionary< String , AnyObject >)->Void)? , failBlock errors:((errorCode: String , errorMessage: String) -> Void)?) {
        
        var afnet = AFHTTPRequestOperationManager()
        var ser   = AFJSONRequestSerializer()
        ser.timeoutInterval = 30
        afnet.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json", "text/json", "text/javascript","text/html") as Set<NSObject>
        afnet.requestSerializer  = ser
        afnet.responseSerializer = AFHTTPResponseSerializer()
        var sendParameter = Dictionary<String , AnyObject>()
        if parameter != nil {
            sendParameter = parameter!
        }
        else {
            var stampTime = timeStamp()
            sendParameter = Dictionary<String , AnyObject>()
        }
        switch type {
        case "POST" :
            afnet.POST(urlString, parameters: sendParameter, success: { [weak self] (operation:  AFHTTPRequestOperation!, anyObject: AnyObject!) -> Void in
                if success != nil {
                    println(operation.responseString)
                    var responseString   = operation.responseString
                    var returnData       = operation.responseData
                    var json: AnyObject? = NSJSONSerialization.JSONObjectWithData(returnData, options: NSJSONReadingOptions.MutableLeaves, error: nil)
                    var jsonDic : Dictionary<String , AnyObject> = json as! Dictionary<String, AnyObject>
                    var resultCode : String = jsonDic["code"] as! String
                    
                    //成功message编码
                    if resultCode == "000000" {
                        success!(returnDic : jsonDic)
                    }
                    else {
                        var errorCode    = resultCode ?? "0"
                        var errorMessage = jsonDic["message"] as? String ?? "未知错误"
                        
                        if errors != nil {
                                errors!(errorCode: errorCode, errorMessage: errorMessage)
                        }
                    }
                
                }
            }, failure: { [weak self](operation: AFHTTPRequestOperation!, error: NSError!) -> Void in
                if(errors != nil)
                {
                    println(error)
                    errors!(errorCode: "404", errorMessage: "网络信号不好哎~")
                }
            })
        case "GET" :
            afnet.GET(urlString, parameters: sendParameter, success: { ( operation: AFHTTPRequestOperation!, anyObject: AnyObject!) -> Void in
                
                }, failure: { (operation: AFHTTPRequestOperation!,error: NSError!) -> Void in
                
            })
        default :
            ""
        }
        
        
    }
    
    func startPostImg(urlSring : String , parameter : Dictionary<String , AnyObject>? ,imgData: [NSData]? , fileKey: String , success:((returnDic : Dictionary<String , AnyObject>) -> Void)? , failure:((errorCode : String , errorMessage: String) -> Void)?)
    {
        if imgData == nil
        {
            self.startRequestNetWorking( "POST", urlString: urlSring, parameter: parameter, successBlock: { [weak self] (returnDic) -> Void in
                if(success != nil)
                {
                    success!(returnDic: returnDic)
                }
                }, failBlock: { [weak self] (errorCode , errorMessage) -> Void in
                    
                    if(failure != nil)
                    {
                        failure!(errorCode: "404", errorMessage: "网络状况不好哎~")
                    }
                })
            return
        }
        var afnet = AFHTTPRequestOperationManager()
        var ser   = AFHTTPRequestSerializer()
        ser.timeoutInterval = 30
        afnet.responseSerializer = AFJSONResponseSerializer()
        afnet.responseSerializer.acceptableContentTypes = NSSet(object: "text/html") as Set<NSObject>
        afnet.requestSerializer  = ser
        var stampTime = timeStamp()
        var sendParameter = Dictionary<String ,AnyObject>()
        if(parameter != nil)
        {
            sendParameter = parameter!
            
        }
        else
        {
            var stampTime = timeStamp()
            var sendParameter = Dictionary<String ,AnyObject>()
            
        }
        afnet.POST(urlSring, parameters: sendParameter, constructingBodyWithBlock: { [weak self](formData) -> Void in
            
            imgData?.map({
                formData.appendPartWithFileData($0, name: fileKey, fileName: "tiancailcy.jpg", mimeType: "image/jpeg")
            })
            return
            
            }, success: { [weak self] (operation, anyObject) -> Void in
                println(operation.responseString)
                if(success != nil)
                {
                    var returnData = operation.responseData
                    var json: AnyObject?       = NSJSONSerialization.JSONObjectWithData(returnData, options: NSJSONReadingOptions.MutableLeaves, error: nil)
                    var jsonDic : Dictionary<String , AnyObject> = json as! Dictionary<String, AnyObject>
                    success!(returnDic: jsonDic)
                }
            }) { [weak self] (operation, error) -> Void in
                if(failure != nil)
                {
                    failure!(errorCode: "404", errorMessage: "网络信号不好哎~")
                }

        }
    }

    
    /**
    获取时间戳
    
    :returns: 返回时间戳
    */
    func timeStamp() -> String
    {
        let a = Int(NSDate().timeIntervalSince1970)
        return "\(a)"
    }
    
    /**
    将时间戳加密
    
    :param: addString 需要加密的字符串
    
    :returns: 返回加密后的时间戳
    */
    func timeStampMD5(addString : NSString) -> String
    {
        return addString.md5()
    }

   
}

