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
    
    var loginResponse: LoginResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
    }
    
    // MARK: - Methods
    func validateUser() -> String? {
        
        if userTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == Constants.String.voidString || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == Constants.String.voidString
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
                    self.loginResponse = message
                    self.transitionToHome()
                case .failure(let error):
                    print("An error occured: \(error)")
                }
            })
            
        }
        
        
    }
    
    func transitionToHome() {
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "loginToHomeSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let homeViewController = segue.destination as! HomeViewController
        
        homeViewController.loginResponse = loginResponse
        
    }
    
}
