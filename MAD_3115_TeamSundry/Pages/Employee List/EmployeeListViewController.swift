//
//  ViewController.swift
//  MAD_3115_TeamSundry
//

import UIKit

class EmployeeListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
         navigationController?.navigationBar.prefersLargeTitles = true
    }

}

