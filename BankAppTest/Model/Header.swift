//
//  Header.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 18/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation

struct User {
    
    var userAccount:UserInfo
    
}


struct UserInfo: Decodable {
    
    var userId:Int
    var name:String
    var bankAccount:String
    var agency:String
    var balance:Float
    
    init(userId: Int, name: String, bankAccount: String, agency: String, balance: Float) {
        self.userId = userId
        self.name = name
        self.bankAccount = bankAccount
        self.agency = agency
        self.balance = balance
    }
    
}
