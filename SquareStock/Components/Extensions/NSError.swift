//
//  NSError.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

enum ErrorType : Int {
    case NetworkError = 100
    case ParseError = 101
    case StoringError = 102
}

extension NSError {
    func connectionError() -> NSError {
        return self.normalisedError(.NetworkError)
    }
    
    func parseError() -> NSError {
        return self.normalisedError(.ParseError)
    }
    
    func storingError() -> NSError {
        return self.normalisedError(.StoringError)
    }
    
    
    private func normalisedError(type : ErrorType) -> NSError {
        return NSError(domain: "com.squarestock.error", code: type.rawValue, userInfo: self.userInfo)
    }
}