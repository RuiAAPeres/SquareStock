//
//  NSError.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

public enum Error : Int {
    case NetworkError = 100
    case ParseError = 101
    case StorageError = 102
}

extension NSError {
    func normalisedError(type : Error) -> NSError {
        return NSError(domain: "com.squarestock.error", code: type.rawValue, userInfo: self.userInfo)
    }
}

func normalisedError(type : Error, optionalError : NSError?) -> NSError {
    
    let userInfo  = optionalError?.userInfo
    return NSError(domain: "com.squarestock.error", code: type.rawValue, userInfo: userInfo)
}