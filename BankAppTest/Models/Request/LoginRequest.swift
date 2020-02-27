//
//  LoginRequest.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 26/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation

final class LoginRequest: Codable {
    var user: String
    var password: String
    
    init(user: String, password: String) {
        self.user = user
        self.password = password
    }
    
}
