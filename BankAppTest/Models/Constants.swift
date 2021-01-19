//
//  Constants.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 25/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Storyboard {
        
        static let homeViewController = "Home"
        
    }
    
    struct String {
        
        static let passError = "Please make sure your password is at least 8 characters, contains at least a special character and a number"
        static let loginError = "Por favor, preencha todos os campos"
        static let voidString = ""
        static let passRequirements = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%#?&#])[A-Za-z\\d$@$!%*?&#]{6,8}"
        static let login = "login"
        static let wallet = "statements/1"
    }
}

