//
//  FunctionalHelpers.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

// MARK: Operators (ideas taken from here: http://chris.eidhof.nl/posts/json-parsing-in-swift.html )

func flatten<A>(a: A??) -> A? {
    
    if let b = a {
        return b
    }
    
    return nil
}

infix operator  <*> { associativity left precedence 160 }
func <*><A, B>(l: (A -> B)?, r: A?) -> B? {
    
    if let l1 = l,  r1 = r {
        return l1(r1)
    }
    
    return nil
}

infix operator  >>>= {associativity left precedence 160}
func >>>= <A,B> (optional : A?, f : A -> B?) -> B? {
    return flatMap(optional, f)
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