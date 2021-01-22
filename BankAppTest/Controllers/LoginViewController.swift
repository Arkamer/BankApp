//
//  LoginViewController.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 16/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)

        
        
    }
    
    // MARK: - Methods
    func validateUser() -> String? {
        
        if userTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            
            errorLabel.text = Constants.String.loginError
    
        }
        
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            
            
            return Constants.String.passError
            
        }
        
        return nil
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        // validate the user
        let error = validateUser()
        
        if error != nil {
            
            print(error!)
            
        } else {
            // Send message/POST method
            let login = LoginRequest(user: userTextField.text!, password: passwordTextField.text!)
            
            let postRequest = UserRequest()
            
            postRequest.postSaving( login, endpoint: Constants.String.login, completion: { result in
                switch result {
                case .success(let message):
                    print("The following message has been sent: \(message.userAccount)")
                case .failure(let error):
                    print("An error occured: \(error)")
                }
            })
            // Transition to the home screen
            transitionToHome()
            
        }
        
        
    }
    
    func transitionToHome() {
        
        // Post request use name and password
        
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
