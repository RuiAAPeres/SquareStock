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

func array(input: JSONDictionary, key: String) ->  JSONArray? {
    let maybeAny : JSON? = input[key]
    return maybeAny >>= { $0 as? JSONArray }
}

func dictionary(input: JSONDictionary, key: String) ->  JSONDictionary? {
    return input[key] >>= { $0 as? JSONDictionary }
}

// Mark: Parsing Stock

func parseStocks(responseResult : Result<NSData, NSError>) -> Result<[Stock],NSError> {
    return responseResult >>- decodeJSON >>- decodeObject
}

private func decodeJSON(data: NSData) -> (Result<JSON,NSError>) {
    
    var error : NSError? = nil
    let jsonOptional: JSON? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error)
    
    return resultFromOptional(jsonOptional, normalisedError(.ParseError, error))
}

func decodeObject<U: JSONDecodable>(json: JSON) -> Result<[U], NSError> {

    let f = curry(flip(array))("stocks")
    let g = {(a : JSONArray) in join(a.map(U.decode))}
   
    let x = resultFromOptional(((_JSONObject(json) >>= f) >>= g), NSError())
    return x
}

