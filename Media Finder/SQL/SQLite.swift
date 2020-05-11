//
//  SQLite.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/30/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import Foundation
import SQLite

class dataBase: NSObject {
    var database: Connection!
    static var share = dataBase()
    let userTable = Table("users")
    let casheDataTable = Table("casheDataTable")
    let name = Expression<String>("name")
    let password = Expression<String>("password")
    let phoneNumber = Expression<String>("phoneNumber")
    let lastSearch = Expression<String>("lastSearch")
    
    
    func connectionDB() -> Connection? {
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        do {
            print("path", path)
            return try Connection("\(path)/db.sqlite3")
        } catch let error {
            print("777777777777", error)
        }
        return nil
    }
    
    func createTable() {
        if let db = self.connectionDB() {
            do {
                try db.run(userTable.create(ifNotExists: true){ t in     // CREATE TABLE "users" (
                    t.column(password) //     "password" INTEGER PRIMARY KEY NOT NULL,
                    t.column(name)                 //     "name" TEXT
                    t.column(phoneNumber)
                })                                 // )
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func handelInsertData(user: DataOfUser){
        
        if let db = dataBase.share.connectionDB(){
            
            do {
                try db.run(self.userTable.insert( self.name <- user.name, self.password <- user.password,  self.phoneNumber <- user.phoneNumber))
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    func casheData(){
        let createTabel = self.userTable.create { (table) in
            
            table.column(self.lastSearch)
        }
        do {
            
            try self.database.run(createTabel)
            print("created Tabel")
            
        } catch { print(error) }
    }
    
    func insertCaheData(text: String){
        let insertUser = self.userTable.insert(self.lastSearch <- text)
        do {
            print("44444444")
            try self.database.run(insertUser)
            print("inserted User")
            
        } catch { print("555555555555",error) }
    }
    
    func getLastSearch() -> String?{
        var text = ""
        
            do {
                let users = try self.database.prepare(self.casheDataTable)
                for data in users {
                    text = data[self.lastSearch]
                    return text
                }
            } catch {
                print(error)
            }
        
        return nil
    }
    func updateCacheData(text: String) {
            let updateUser = userTable.update(self.lastSearch <- text)
            
            do {
                
                try self.database.run(updateUser)
                
                
            } catch { print(error) }
            
            
        }
    
        
    }

