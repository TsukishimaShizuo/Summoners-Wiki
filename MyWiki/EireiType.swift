//
//  EireiStatusType.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/12.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import Foundation

enum EireiType {
    case Unknown
    case Stamina
    case Attack
    case Defence
    case Support
    
    func getDescription() -> String {
        switch self {
        case .Stamina:
            return "体力系"
        case .Attack:
            return "攻撃系"
        case .Defence:
            return "防衛系"
        case .Support:
            return "サポート系"
        default:
            return ""
        }
    }
    
    static func convertToProperty(propID : Int) -> EireiType {
        switch propID {
        case EireiType.Unknown.hashValue:
            return EireiType.Unknown
        case EireiType.Stamina.hashValue:
            return EireiType.Stamina
        case EireiType.Attack.hashValue:
            return EireiType.Attack
        case EireiType.Defence.hashValue:
            return EireiType.Defence
        case EireiType.Support.hashValue:
            return EireiType.Support
        default:
            return EireiType.Unknown
        }
    }
}