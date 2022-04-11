//
//  ResponseTests.swift
//  GBShopTests
//
//  Created by Evgeny Alekseev on 14.03.2022.
//

import XCTest
@testable import GBShop

class ResponseTests: XCTestCase {
    
    var requestFactory: RequestFactory!
    var waitingTime: TimeInterval!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        requestFactory = RequestFactory()
        waitingTime = 10
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        requestFactory = nil
        waitingTime = nil
    }
    
    // MARK: test auth request
    func test_loginRequest() {
        let request = requestFactory.makeAuthRequestFactory()
        let expectation = expectation(description: "Login complete")
        
        request.login(username: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let result):
                print("*** Login result: \(result) ***")
            case .failure(let error):
                print(error)
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
    // MARK: test logout request
    func test_logoutRequest() {
        let request = requestFactory.makeLogoutRequestFactory()
        let expectation = expectation(description: "Logout complete")
        
        request.logout(userID: 1) { response in
            switch response.result {
            case .success(let result):
                print("*** Logout result: \(result) ***")
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
    // MARK: test registration request
    func test_registrationRequest() {
        let request = requestFactory.makeRegisterUserRequestFactory()
        let expectation = expectation(description: "Registration complete")
        
        request.register(userID: 2,
                         username: "User2",
                         password: "password2",
                         email: "user2@test.com",
                         gender: "m",
                         creditCard: "1111222233334444",
                         bio: "I am Groot") { response in
            switch response.result {
            case .success(let result):
                print("*** Registration result: \(result) ***")
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
    // MARK: test change user data
    func test_changeUserDataRequest() {
        let request = requestFactory.makeChangeUserDataRequestFactory()
        let expectation = expectation(description: "Data changed")
        
        request.change(userID: 2,
                       username: "newUserName",
                       password: "newPassword",
                       email: "newEmail@",
                       gender: "f",
                       creditCard: "9999888877776666",
                       bio: "I am not Groot") { response in
            switch response.result {
            case .success(let result):
                print("*** Change user data result: \(result) ***")
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
    // MARK: test logout request
    func test_getProductRequest() {
        let request = requestFactory.makeGetProductRequestFactory()
        let expectation = expectation(description: "Product received")
        
        request.getProduct(productID: 123) { response in
            switch response.result {
            case .success(let result):
                print("*** Product info: \(result) ***")
            case .failure:
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
    func test_getCatalogRequest() {
        let request = requestFactory.makeGetCatalogRequestFactory()
        let expectation = expectation(description: "Catalog received")
        
        request.getCatalog(pageNumber: 1, categoryID: 1) { response in
            switch response.result {
            case .success(let result):
                print("*** Category info: \(result) ***")
            case .failure(let error):
                print(error)
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
}
