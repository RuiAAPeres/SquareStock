//
//  Parsing.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation


// Mark: Utilities (taken from here: https://gist.github.com/chriseidhof/4c071de50461a802874e)

private func toURL(urlString: String) -> NSURL {
    return NSURL(string: urlString)!
}

private func asDict(x: AnyObject) -> [String:AnyObject]? {
    return x as? [String:AnyObject]
}

private func array(input: [String:AnyObject], key: String) ->  [AnyObject]? {
    let maybeAny : AnyObject? = input[key]
    return maybeAny >>>= { $0 as? [AnyObject] }
}

private func dictionary(input: [String:AnyObject], key: String) ->  [String:AnyObject]? {
    return input[key] >>>= { $0 as? [String:AnyObject] }
}

private func string(input: [String:AnyObject], key: String) -> String? {
    return input[key] >>>= { $0 as? String }
}

private func number(input: [NSObject:AnyObject], key: String) -> NSNumber? {
    return input[key] >>>= { $0 as? NSNumber }
}

private func int(input: [NSObject:AnyObject], key: String) -> Int? {
    return number(input,key).map { $0.integerValue }
}

private func bool(input: [NSObject:AnyObject], key: String) -> Bool? {
    return number(input,key).map { $0.boolValue }
}


// Mark: Parsing

func parseStocks(data : NSData) -> [Stock]? {
    
}



