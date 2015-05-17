//
//  Stock.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

public struct Stock {
    let symbol : String
    let name : String
    let currency : String
    let price : Double
    let delta : Double
}

extension Stock: JSONDecodable {
    
    static func decode(json: JSON) -> Stock? {
        
        return _JSONObject(json) >>= { d in
            
            if  let symbol   = d["symbol"]   >>= _JSONString,
                let name     = d["name"]     >>= _JSONString,
                let currency = d["currency"] >>= _JSONString,
                let price    = d["price"]    >>= _JSONDouble,
                let delta    = d["delta"]    >>= _JSONDouble
            {
                return Stock(symbol: symbol, name: name, currency: currency, price: price, delta: delta)
            }
            
            return nil
        }
    }
}