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

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testParsingValidNASDAQ100Stocks() {
        
        let path = NSBundle(forClass: self.dynamicType).pathForResource("NASDAQ100", ofType: "json")!
        let jsonData = NSData(contentsOfFile: path)!
        let result = Result<NSData, NSError>(value: jsonData)
        
        let stocks = parseStocks(result)
        
        if let unwrappedStocks = stocks.value {
            XCTAssertTrue(unwrappedStocks.count == 99)
        } else {
            XCTFail()
        }
    }
}
 