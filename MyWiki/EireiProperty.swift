//
//  EireiAttributeType.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/12.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import Foundation

enum EireiProperty {
    case Unknown
    case Fire
    case Water
    case Wind
    case Light
    case Dark
    
    func getDescription() -> String {
        switch self {
        case .Fire:
            return "火"
        case .Water:
            return "水"
        case .Wind:
            return "風"
        case .Light:
            return "光"
        case .Dark:
            return "闇"
        default:
            return ""
        }
    }
    
    static func convertToProperty(propID : Int) -> EireiProperty {
        switch propID {
        case EireiProperty.Unknown.hashValue:
            return EireiProperty.Unknown
        case EireiProperty.Fire.hashValue:
            return EireiProperty.Fire
        case EireiProperty.Water.hashValue:
            return EireiProperty.Water
        case EireiProperty.Wind.hashValue:
            return EireiProperty.Wind
        case EireiProperty.Light.hashValue:
            return EireiProperty.Light
        case EireiProperty.Dark.hashValue:
            return EireiProperty.Dark
        default:
            return EireiProperty.Unknown
        }
    }
}