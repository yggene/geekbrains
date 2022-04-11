//
//  TemplateTests.swift
//  GBShopTests
//
//  Created by Evgeny Alekseev on 27.03.2022.
//

import XCTest
import Alamofire
@testable import GBShop

struct PostStub: Codable {
    let result: Int
}

enum ApiErrorStub: Error {
    case fatalError
}

struct ErrorParserStub: AbstractErrorParser {
    func parse(_ result: Error) -> Error {
        return ApiErrorStub.fatalError
    }
    
    func parse(response: HTTPURLResponse?,
               data: Data?,
               error: Error?) -> Error? {
        return error
    }
}

class TemplateTests: XCTestCase {
    
    let expectation = XCTestExpectation(description: "Download https://failUrl")
    var errorParser: ErrorParserStub!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        errorParser = ErrorParserStub()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        errorParser = nil
    }
    
    func test_shouldAuthorize() {
        
        AF.request("https://raw.githubusercontent.com/GeekBrainsTutorial/online-store-api/master/responses/login.json")
            .responseCodable(errorParser: errorParser) { [weak self] (response: DataResponse<PostStub, AFError>) in
                switch response.result {
                case .success(let result):
                    print("*** Result: \(result) ***")
                    break
                case .failure(let error):
                    print("*** Error: \(error) ***")
                    XCTFail()
                }
                self?.expectation.fulfill()
            }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
