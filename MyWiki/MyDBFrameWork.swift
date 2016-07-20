//
//  MyDBFrameWork.swift
//  MyWiki
//
//  Created by 月島静雄 on 2016/05/18.
//  Copyright © 2016年 月島静雄. All rights reserved.
//

import Foundation

class MyDBFW {
    
    static let sharedInstance = MyDBFW();
    var testData : [EireiInfo] = [EireiInfo]()
    var dbConnection: COpaquePointer = nil
    let dbName = "Eirei.sqlite"
    
    private init(){
        tryConnect()
    }
    
    var documentPath : String = {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        return paths.first!
    } ()
    
    
    func tryConnect() {
        let path : NSString = "\(documentPath)/Eirei.sqlite"
        if !(NSFileManager.defaultManager().fileExistsAtPath(String(path))) {
            guard let rp = NSBundle.mainBundle().resourcePath else { return }
            let from = (rp as NSString).stringByAppendingPathComponent(dbName)
            print(rp)
            print(from)
            do {
                try NSFileManager.defaultManager().copyItemAtPath(from, toPath:path as String)
            } catch {
                print("failed to copy DB!")
                return
            }
        }
        let fileName = path.UTF8String
        if sqlite3_open(fileName, &dbConnection) != SQLITE_OK {
            sqlite3_close_v2(dbConnection)
            print("connect failed")
            return
        }
    }
    
    func fetchEireiIDs(eireiStar : Int, eireiProperty : EireiProperty) -> [Int] {
        var stmt: COpaquePointer = nil
        var ss : NSString = "select EireiID from EireiInfo"
        var needAppendAnd = 0
        var result = [Int]()
        if eireiStar != 0 || eireiProperty != EireiProperty.Unknown {
            ss = ss.stringByAppendingString(" where")
        }
        if eireiStar != 0 {
            if needAppendAnd == 0{
                needAppendAnd += 1
            }
            ss = ss.stringByAppendingString(" EireiStar=\(eireiStar)")
        }
        if eireiProperty != EireiProperty.Unknown {
            if needAppendAnd == 0{
                needAppendAnd += 1
            } else if needAppendAnd > 0 {
                ss = ss.stringByAppendingString(" and")
            }
            ss = ss.stringByAppendingString(" EireiProperty=\(eireiProperty.hashValue)")
        }
        print(ss)
        let sql = ss.UTF8String
        if sqlite3_prepare_v2(dbConnection, sql, -1, &stmt, nil) != SQLITE_OK{
            sqlite3_close_v2(dbConnection)
            print("select failed")
            print(NSString(UTF8String: UnsafePointer(sqlite3_errmsg(dbConnection))))
            sqlite3_finalize(stmt)
            return [Int]()
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            result.append((NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 0)))?.integerValue)!)
        }
        sqlite3_finalize(stmt)
        return result
    }
    
    func fetchEireiDetailInfo(eireiID : Int) -> EireiInfo {
        
        var stmt: COpaquePointer = nil
        let ss : NSString = "select * from EireiInfo inner join EireiSkill where EireiInfo.EireiID=\(eireiID) and EireiSkill.EireiID=\(eireiID)"
        print(ss)
        let sql = ss.UTF8String
        if sqlite3_prepare_v2(dbConnection, sql, -1, &stmt, nil) != SQLITE_OK{
            sqlite3_close_v2(dbConnection)
            print("select failed")
            print(NSString(UTF8String: UnsafePointer(sqlite3_errmsg(dbConnection))))
            return EireiInfo()
        }
        
        let aData = EireiInfo()
        while sqlite3_step(stmt) == SQLITE_ROW {
            aData.id = (NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 0)))!.integerValue)
            aData.name = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 1)))!)
            aData.star = (NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 2)))!.integerValue)
            aData.property = EireiProperty.convertToProperty(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 3)))!.integerValue)
            aData.type = EireiType.convertToProperty(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 4)))!.integerValue)
            aData.stamina = (NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 5)))!.integerValue)
            aData.attack = (NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 6)))!.integerValue)
            aData.defence = (NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 7)))!.integerValue)
            aData.speed = (NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 8)))!.integerValue)
            
            let s1 = EireiSkill()
            let s2 = EireiSkill()
            let s3 = EireiSkill()
            let s4 = EireiSkill()

            s1.name = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 10)))!)
            s1.description = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 14)))!)
            aData.skill1 = s1
            s2.name = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 11)))!)
            s2.description = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 15)))!)
            aData.skill2 = s2
            s3.name = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 12)))!)
            s3.description = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 16)))!)
            aData.skill3 = s3
            s4.name = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 13)))!)
            s4.description = String(NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 17)))!)
            aData.skill4 = s4
        }
        sqlite3_finalize(stmt)
        return aData
    }
    
    func getDataCount(eireiStar : Int, eireiProperty : EireiProperty) -> Int {
        var stmt: COpaquePointer = nil
        var result = 0
        var ss : NSString = "select count(*) from EireiInfo"
        var needAppendAnd = 0
        if eireiStar != 0 || eireiProperty != EireiProperty.Unknown {
            ss = ss.stringByAppendingString(" where")
        }
        if eireiStar != 0 {
            if needAppendAnd == 0{
                needAppendAnd += 1
            }
            ss = ss.stringByAppendingString(" EireiStar=\(eireiStar)")
        }
        if eireiProperty != EireiProperty.Unknown {
            if needAppendAnd == 0{
                needAppendAnd += 1
            } else if needAppendAnd > 0 {
                ss = ss.stringByAppendingString(" and")
            }
            ss = ss.stringByAppendingString(" EireiProperty=\(eireiProperty.hashValue)")
        }
        print(ss)
        let sql = ss.UTF8String
        if sqlite3_prepare_v2(dbConnection, sql, -1, &stmt, nil) != SQLITE_OK{
            sqlite3_close_v2(dbConnection)
            print("select failed")
            print(NSString(UTF8String: UnsafePointer(sqlite3_errmsg(dbConnection))))
            sqlite3_finalize(stmt)
            return result
        }
        
        while sqlite3_step(stmt) == SQLITE_ROW {
            result = (NSString(UTF8String: UnsafePointer(sqlite3_column_text(stmt, 0)))?.integerValue)!
        }
        sqlite3_finalize(stmt)
        return result
    }
}