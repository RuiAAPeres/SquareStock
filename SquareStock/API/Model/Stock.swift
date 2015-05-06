//
//  Stock.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

struct Stock {
    let symbol : String
    let name : String
    let currency : String
    let price : Double
    let delta : Double
}

extension Stock: JSONDecodable {
    
    static func factory(symbol: String)(name : String)(currency : String)(price : Double)(delta : Double) -> Stock {
        return Stock(symbol: symbol, name: name, currency: currency, price: price, delta: delta)
    }
    
    static func decode(json: JSON) -> Stock? {
        return _JSONObject(json) >>= { x in
            
            Stock.factory <^>
                x["id"]     >>= _JSONInt    <*>
                x["name"]   >>= _JSONString <*>
                x["email"]  >>= _JSONString
        }
    }
}