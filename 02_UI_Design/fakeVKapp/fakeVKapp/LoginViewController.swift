//
//  ViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var appLogo: UIImageView!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var loginInputField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordInputField: UITextField!
    @IBOutlet var myScrollView: UIScrollView!
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        isValidUser() ?
            print("Welcome, \(loginInputField.text ?? "Anonymous One")!") :
            print("Incorrect login or password")
    }
    
    func isValidUser() -> Bool {
        loginInputField.text == "admin" && passwordInputField.text == "12345"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

