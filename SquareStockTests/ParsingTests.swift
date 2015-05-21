//
//  ParsingTests.swift
//  SquareStock
//
//  Created by Rui Peres on 20/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import XCTest
import SquareStock
import Result

class ParsingTests: XCTestCase {

    func testParsingValidNASDAQ100Stocks() {
        let jsonData = dataFromJSONFile(self.dynamicType, "NASDAQ100")
        let result = Result<NSData, NSError>(value: jsonData)
        
        let stocks = parseStocks(result)
        
        if let unwrappedStocks = stocks.value {
            XCTAssertTrue(unwrappedStocks.count == 99)
        } else {
            XCTFail()
        }
    }
    
    func testIncompleteJSON() {
        let jsonData = dataFromJSONFile(self.dynamicType, "IncompleteJSON")
        let result = Result<NSData, NSError>(value: jsonData)
        
        let stocks = parseStocks(result)

        if let unwrappedError = stocks.error {
            XCTAssertTrue(unwrappedError.code == Error.ParseError.rawValue, "Should be a parsing error")
        } else {
            XCTFail()
        }
    }
    
}
 