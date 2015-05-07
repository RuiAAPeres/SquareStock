//
//  FunctionalHelpers.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

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

public func curry<A,B,C,D,E, F>(f: (A,B,C,D,E) -> F) -> A -> B -> C -> D -> E -> F {
    return { a in { b in { c in { d in { e in f(a,b,c,d,e) } } } } }
}