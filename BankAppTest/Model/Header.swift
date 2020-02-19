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
    
}
