//
//  FunctionalHelpers.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

// MARK: Optionals Operators (ideas taken from here: https://github.com/thoughtbot/FunctionalJSON-swift/blob/d3fcf771c20813e57cb54472dd8c55ee33e87ae4/FunctionalJSON/Functional.swift#L5 )

func >>= <T, U>(a: T?, f: T -> U?) -> U? {
    if let x = a {
        return f(x)
    } else {
        return .None
    }
}

func <^> <T, U>(f: T -> U, a: T?) -> U? {
    if let x = a {
        return f(x)
    } else {
        return .None
    }
}

func <*><T, U>(f: (T -> U)?, a: T?) -> U? {
    if let x = a {
        if let fx = f {
            return fx(x)
        }
    }
    return .None
}

// MARK: Curry

public func curry<A, B, C>(f : (A, B) -> C) -> A -> B -> C {
    return { a in { b in f(a, b) } }
}

public func curry<A,B,C,D>(f: (A,B,C) -> D) -> A -> B -> C -> D {
    return { a in { b in { c in f(a,b,c) } } }
}

public func curry<A,B,C,D,E>(f: (A,B,C,D) -> E) -> A -> B -> C -> D -> E {
    return { a in { b in { c in { d in f(a,b,c,d) } } } }
}