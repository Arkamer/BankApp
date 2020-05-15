//
//  HomeViewController.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 16/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var accountAndAgency: UILabel!
    @IBOutlet weak var balance: UILabel!
    
    var loginResponse: LoginResponse?
    
    // MARK: - Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        guard let responses = loginResponse else { return }

        name.text! = responses.userAccount.name
        accountAndAgency.text! = "\(responses.userAccount.agency) / \(responses.userAccount.bankAccount)"
        balance.text! = "\(responses.userAccount.balance)"
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: value(forKey: "2") as! UITableViewCell.CellStyle, reuseIdentifier: "walletCell")
        
        return cell
    }

}

