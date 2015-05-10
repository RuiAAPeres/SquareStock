//
//  Parsing.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import Result

// Mark: Utilities (taken from here: https://gist.github.com/chriseidhof/4c071de50461a802874e and https://robots.thoughtbot.com/efficient-json-in-swift-with-functional-concepts-and-generics)

typealias JSON = AnyObject
typealias JSONDictionary = [String : JSON]
typealias JSONArray = [JSON]

func _JSONString(object: JSON) -> String? {
    return object as? String
}

func _JSONDouble(object: JSON) -> Double? {
    return object as? Double
}

func _JSONObject(object: JSON) -> JSONDictionary? {
    return object as? JSONDictionary
}

func _JSONArray(object: JSON) -> JSONArray? {
    return object as? JSONArray
}

func _JSON<T>(object : JSON) -> T? {
    return object as? T
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

// Mark: Parsing Stock

func parseStocks(responseResult : Result<NSData, NSError>) -> Result<[Stock],NSError> {
    return responseResult >>- decodeJSON >>- decodeStocks
    
}

private func decodeJSON(data: NSData) -> Result<JSON,NSError> {
    
    var error : NSError? = nil
    let jsonOptional: JSON? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error)
    
    return resultFromOptional(jsonOptional, normalisedError(.ParseError, error))
}

func decodeStocks<U: JSONDecodable>(json: JSON) -> Result<[U], NSError> {
    
    
    let x = _JSONObject(json) >>= curry(flip(array))("stocks")
    
        
    return resultFromOptional([U.decode(json)!], NSError())
}

func flip <T,U,V>(f: (T, U) -> V) -> (U,T) -> V {
    return {(a,b) in f(b,a)}
}

func array(input: [String:AnyObject], key: String) ->  JSONArray? {
    let maybeAny : AnyObject? = input[key]
    return maybeAny >>= { $0 as? JSONArray }
}

func dictionary(input: [String:AnyObject], key: String) ->  JSONDictionary? {
    return input[key] >>= { $0 as? JSONDictionary }
}


