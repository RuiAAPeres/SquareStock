//
//  Parsing.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import LlamaKit


// Mark: Utilities (taken from here: https://gist.github.com/chriseidhof/4c071de50461a802874e and https://robots.thoughtbot.com/efficient-json-in-swift-with-functional-concepts-and-generics)

typealias JSON = AnyObject
typealias JSONDictionary = [String:JSON]
typealias JSONArray = [JSON]

func _JSONString(object: JSON) -> String? {
    return object as? String
}

func _JSONInt(object: JSON) -> Int? {
    return object as? Int
}

func _JSONDouble(object: JSON) -> Double? {
    return object as? Double
}

func _JSONObject(object: JSON) -> JSONDictionary? {
    return object as? JSONDictionary
}

// Mark: Parsing

func parseStocks(responseResult : Result<NSData, NSError>) -> Result<[Stock],NSError> {
    return failure(NSError())
}

private func decodeJSON(data: NSData) -> Result<JSON,NSError> {
    
    var error : NSError? = nil
    let jsonOptional: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error)
    
    return resultFromOptional(jsonOptional, normalisedError(.ParseError, error))
}



