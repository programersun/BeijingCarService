//
//  SR_StringExtension.swift
//  BeijingCarService
//
//  Created by 瑞孙 on 15/7/1.
//  Copyright (c) 2015年 瑞孙. All rights reserved.
//

import Foundation
/**
根据故事版返回故事版名称

- StoryNameFirst  :
- StoryNameSecond :
- StoryNameThird  :
- StoryNameFourth :
*/
enum StoryNameType : String
{
    case StoryNameFirst  = "Notice"
    case StoryNameSecond = "RepairRecords"
    case StoryNameThird  = "MyCar"
    case StoryNameFourth = "Consultation"
    case StoryNameFifth  = "My"
    case StoryNameLogin  = "Login"
}

extension String {
    
    /// 线程实效通知key
    static func notyForSessionEndName() -> String
    {
        return "notiForSessionEndTime"
    }
    
    ///网络连接时的通知
    static func notyForNetRecoverName() -> String
    {
        return "notyForNetRecoverKey"
    }
    
    /**
    根据故事版的类型返回对应故事版的名称
    
    :param: storyType 故事版类型
    
    :returns: 故事版名称
    */
    static func StoryForString(storyType : StoryNameType) -> String
    {
        return storyType.rawValue
    }
    
    /**
    根据index返回tabbar对应的信息
    
    :param: index tabbar 对应的item
    
    :returns: 返回tabbar的信息如图片名称、标题名称
    */
    static func itemSelectImgString(index : Int) -> (selectImg: String , image: String , titleString : String)
    {
        switch index
        {
        
        case 0:
            return ("firstItem_Select" , "firstItem" , "通知公告")
        case 1:
            return ("secondItem_Select" , "secondItem" , "修车记录")
        case 2:
            return ("thirdItem_Select" , "thirdItem" , "我的车")
        case 3:
            return ("fourthItem_Select" , "fourthItem" , "在线咨询")
        case 4:
            return ("fifthItem_Select" , "fifthItem" , "我的")
        default:
            return ("firstItem_Select" , "firstItem" , "我")
        }
    }

}
