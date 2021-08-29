//
//  LoginViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.08.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet var appLogo: UIImageView!
    @IBOutlet var loginLabel: UILabel!
    @IBOutlet var loginInputField: UITextField!
    @IBOutlet var passwordLabel: UILabel!
    @IBOutlet var passwordInputField: UITextField!
    @IBOutlet var myScrollView: UIScrollView!
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        if isValidUser() {
            print("Welcome, \(loginInputField.text!)!")
        } else {
            print("Incorrect username and/or password")
            showAlert()
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if identifier == "loginSegue" {
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myScrollView.addGestureRecognizer(UITapGestureRecognizer(
                                            target: self,
                                            action: #selector(hideKeyboard)))
    }
    
    @objc func hideKeyboard() {
        self.myScrollView?.endEditing(true)
    }
    
}
