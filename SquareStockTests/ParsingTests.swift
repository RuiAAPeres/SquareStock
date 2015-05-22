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
    
    func resultFromJSON(file : String) -> Result<NSData, NSError> {
        let jsonData = dataFromJSONFile(self.dynamicType, file)
        return Result<NSData, NSError>(value: jsonData)
    }
    
    func testValidNASDAQ100Stocks() {
        let result = resultFromJSON("NASDAQ100")
        assertOptional(parseStocks(result).value){XCTAssertTrue($0.count == 99)}
    }
    
    func testEmptyStocks() {
        let result = resultFromJSON("EmptyJSON")
        assertOptional(parseStocks(result).value){XCTAssertTrue($0.count == 0)}
    }
    
    func testMissingProperty() {
        let result = resultFromJSON("MissingPropertyStock")
        assertOptional(parseStocks(result).error){XCTAssertTrue($0.code == Error.ParseError.rawValue)}
    }

    func testIncompleteJSON() {
        let result = resultFromJSON("IncompleteJSON")
        assertOptional(parseStocks(result).error){XCTAssertTrue($0.code == Error.ParseError.rawValue)}
    }
    
    func testEmptyData() {
        let result = Result<NSData, NSError>(value: NSData())
        assertOptional(parseStocks(result).error){XCTAssertTrue($0.code == Error.ParseError.rawValue)}
    }
}
 