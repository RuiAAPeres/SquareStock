//
//  Optional.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

func >>= <T, U>(a: T?, f: T -> U?) -> U? {
    return flatMap(a, f)
}

func <*><T, U>(l: (T -> U)?, r: T?) -> U? {
    if  let l1 = l,
        let r1 = r
    {
        return l1(r1)
    }
    return nil
}

func join<T>(elements: [T?]) -> [T]? {
    var result : [T] = []
    for element in elements {
        if let x = element {
            result += [x]
        } else {
            return nil
        }
    }
    return result
}
