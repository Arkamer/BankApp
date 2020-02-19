//
//  Wallet.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 18/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation

struct Transactions: Decodable {
    
    var wallet:[WalletList]
}

struct WalletList: Decodable {
    
    var statementList:Info
}

struct Info: Decodable {
    
    var title:String
    var desc:String
    var date:String
    var value:Float
    
}
