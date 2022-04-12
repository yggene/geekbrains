//
//  AppDelegate.swift
//  GBShop
//
//  Created by Evgeny Alekseev on 14.03.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let requestFactory = RequestFactory()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // insert test methods below
        authRequest()
        logoutRequest()
        registrationRequest()
        changeUserDataRequest()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    // MARK: test auth request
    private func authRequest() {
        let request = requestFactory.makeAuthRequestFactory()
        request.login(username: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let result):
                print("Auth result: ", result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: test logout request
    private func logoutRequest() {
        let request = requestFactory.makeLogoutRequestFactory()
        request.logout(userID: 1) { response in
            switch response.result {
            case .success(let result):
                print("Logout result: ", result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: test registration request
    private func registrationRequest() {
        let request = requestFactory.makeRegisterUserRequestFactory()
        request.register(userID: 2,
                         username: "User2",
                         password: "password2",
                         email: "user2@test.com",
                         gender: "m",
                         creditCard: "1111222233334444",
                         bio: "I am Groot") { response in
            switch response.result {
            case .success(let result):
                print("Registration result: ", result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // MARK: test change user data
    private func changeUserDataRequest() {
        let request = requestFactory.makeChangeUserDataRequestFactory()
        request.change(userID: 2,
                       username: "newUserName",
                       password: "newPassword",
                       email: "newEmail@",
                       gender: "f",
                       creditCard: "9999888877776666",
                       bio: "I am not Groot") { response in
            switch response.result {
            case .success(let result):
                print("Change user data result: ", result)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

