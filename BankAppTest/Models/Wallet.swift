//
//  Wallet.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 18/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation


struct Transactions: Decodable {
    
    var statementList:[WalletList]
    
    init(statementList: [WalletList]) {
        
        self.statementList = statementList
        
    }
    
}

struct WalletList: Decodable {
    
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
