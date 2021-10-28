//
//  LoginViewController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 12.08.2021.
//

import UIKit
import FirebaseAuth

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
            showAlert(title: "Error", message: "Check login/pass")
        }
    }
    
    @IBAction func watchAnimationsButtonPressed(_ sender: Any) {}
    
    
    override func shouldPerformSegue(withIdentifier identifier: String,
                                     sender: Any?) -> Bool {
        if identifier == "loginSegue" || identifier == "animationsSegue" {
            return isValidUser()
        } else {
            return false
        }
    }
    
    func isValidUser() -> Bool {
        //loginInputField.text == "" && passwordInputField.text == ""
        guard let username = loginInputField.text,
              let password = passwordInputField.text,
              !username.isEmpty,
              !password.isEmpty
        else {
            showAlert(title: "Incorrect data", message: "Check login/pass")
            return false
        }
        
        Auth.auth().signIn(
            withEmail: username,
            password: password) { [weak self] authResult, authError in
            if let error = authError {
                self?.showAlert(title: "Error", message: error.localizedDescription)
            } else {
                let navController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarController")
            }
        }
        
        return true
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        let alertItem = UIAlertAction(
            title: "OK",
            style: .default)
        alertController.addAction(alertItem)
        present(alertController,
                animated: true,
                completion: nil)
    }
    
    @objc func hideKeyboard() {
        self.myScrollView?.endEditing(true)
    }
    
    @IBAction func unwindToLogin(segue: UIStoryboardSegue){}
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
}
