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
        waitingTime = 10.0
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        requestFactory = nil
        waitingTime = nil
    }
    
    // MARK: test login request
    func test_loginRequest() {
        let request = requestFactory.makeAuthRequestFactory()
        let expectation = expectation(description: "Login complete")
        
        request.login(username: "Somebody", password: "mypassword") { response in
            switch response.result {
            case .success(let data):
                print("\n***\n Login data: \(data) \n***\n")
                break
            case .failure(let error):
                print("\n***\n Login error: \(error) \n***\n")
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
            case .success(let data):
                print("\n***\n Logout data: \(data) \n***\n")
                break
            case .failure(let error):
                print("\n***\n Logout error: \(error) \n***\n")
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
            case .success(let data):
                print("\n***\n Registration result: \(data) \n***\n")
            case .failure(let error):
                print("\n***\n Registration error: \(error) \n***\n")
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
            case .success(let data):
                print("\n***\n Update data: \(data) \n***\n")
                break
            case .failure(let error):
                print("\n***\n Update error: \(error) \n***\n")
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
    // MARK: test get product request
    func test_getProductRequest() {
        let request = requestFactory.makeGetProductRequestFactory()
        let expectation = expectation(description: "Product received")

        request.getProduct(productID: 123) { response in
            switch response.result {
            case .success(let data):
                print("\n***\n Get Product data: \(data) \n***\n")
            case .failure(let error):
                print("\n***\n Get Product error: \(error) \n***\n")
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
    
    // MARK: test get catalog request
    func test_getCatalogRequest() {
        let request = requestFactory.makeGetCatalogRequestFactory()
        let expectation = expectation(description: "Catalog received")

        request.getCatalog(pageNumber: 1, categoryID: 1) { response in
            switch response.result {
            case .success(let data):
                print("\n***\n Get Catalog data: \(data) \n***\n")
            case .failure(let error):
                print("\n***\n Get Catalog error: \(error) \n***\n")
                XCTFail()
            }
            expectation.fulfill()
        }
        waitForExpectations(timeout: waitingTime)
    }
}
