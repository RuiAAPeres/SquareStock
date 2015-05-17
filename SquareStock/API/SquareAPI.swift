//
//  SquareAPI.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import Result

let baseURL : NSURL = NSURL(string:"https://squarestock.herokuapp.com/api/v2/")!

public func fetchStock(market : Market, completion : Result<[Stock], NSError> -> ())  {
    
    let resource = Resource<[Stock]>(path: pathFor(market: market), method: .GET, requestBody: nil, headers: [:], parse: parseStocks)
    
    request(baseURL, resource, completion)
}