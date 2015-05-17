//
//  APITests.swift
//  SquareStock
//
//  Created by Rui Peres on 17/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import XCTest
import OHHTTPStubs
import SquareStock

let host = "squarestock.herokuapp.com"

class APITests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_Fetch_GET_Stocks_NASDAQ100() {
        OHHTTPStubs.stubRequestsPassingTest({$0.URL!.host == host}) { _ in
            // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
            let fixture = OHPathForFile("NASDAQ100.json", self.dynamicType)
            return OHHTTPStubsResponse(fileAtPath: fixture!,
                statusCode: 200, headers: ["Content-Type":"application/json"])
        }
        
        
        
    }
}
