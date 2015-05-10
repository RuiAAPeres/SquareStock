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

// Mark: Parsing

func parseStocks(responseResult : Result<NSData, NSError>) -> Result<Stock,NSError> {
    return responseResult >>= decodeJSON >>= decodeObject

}

private func decodeJSON(data: NSData) -> Result<JSON,NSError> {
    
    var error : NSError? = nil
    let jsonOptional: JSON? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: &error)
    
    return resultFromOptional(jsonOptional, normalisedError(.ParseError, error))
}

func decodeObject<U: JSONDecodable>(json: JSON) -> Result<U, NSError> {
    return resultFromOptional(U.decode(json), NSError())
}

//func decodeArray<U: JSONDecodable>(json: JSON) -> Result<[U], NSError> {
//    return resultFromOptional(U.decode(json), NSError())
//}


