//
//  Result.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import Result

func resultFromOptional<T,E>(optional : T?, error : E) -> Result<T,E> {
    if let a = optional {
        return Result(value: a)
    }
    else {
        return Result(error: error)
    }
}
