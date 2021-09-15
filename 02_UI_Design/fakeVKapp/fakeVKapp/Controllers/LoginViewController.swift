//
//  LoginViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet var appLogo: UIImageView!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var loginInputField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordInputField: UITextField!
    @IBOutlet var myScrollView: UIScrollView!
    
    // MARK: Actions
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        if isValidUser() {
            print("Welcome, \(loginInputField.text!)!")
        } else {
            print("Incorrect username and/or password")
            showAlert()
        }
    }
    
    @IBAction func watchAnimationsButtonPressed(_ sender: Any) {
        
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if identifier == "loginSegue" || identifier == "animationsSegue" {
            return isValidUser()
        } else {
            return false
        }
    }
    
    func isValidUser() -> Bool {
        loginInputField.text == "" && passwordInputField.text == ""
    }
    
    private func showAlert() {
        let alertController = UIAlertController(
            title: "Error",
            message: "Incorrect username or password",
            preferredStyle: .alert)
        let alertItem = UIAlertAction(
            title: "OK",
            style: .default)
        { _ in
            self.loginInputField.text = ""
            self.passwordInputField.text = ""
        }
        alertController.addAction(alertItem)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    @objc func hideKeyboard() {
        self.myScrollView?.endEditing(true)
    }
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
}
