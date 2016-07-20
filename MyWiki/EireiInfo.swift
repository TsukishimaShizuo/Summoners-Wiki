//
//  EireiInfo.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/12.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import Foundation

class EireiInfo {
    var id : Int = 0
    var name : String = ""
    var star : Int = 0
    var property : EireiProperty = EireiProperty.Unknown
    var type : EireiType = EireiType.Unknown
    var stamina : Int = 0
    var attack : Int = 0
    var defence : Int = 0
    var speed : Int = 0
    var skill1 : EireiSkill = EireiSkill()
    var skill2 : EireiSkill = EireiSkill()
    var skill3 : EireiSkill = EireiSkill()
    var skill4 : EireiSkill = EireiSkill()
}