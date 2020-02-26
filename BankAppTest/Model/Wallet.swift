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
    
    init(wallet: [WalletList]) {
        
        self.wallet = wallet
        
    }
    
}

struct WalletList: Decodable {
    
    var statementList:Info
    
    init(statementList: Info) {
        
        self.statementList = statementList
        
    }
    
}

struct Info: Decodable {
    
    var title:String
    var desc:String
    var date:String
    var value:Float
    
    init(title: String, desc: String, date: String, value: Float) {
        
        self.title = title
        self.desc = desc
        self.date = date
        self.value = value
        
    }
    
}
