//
//  SquareAPI.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import ReactiveCocoa

func fetchStock (market : Market) -> SignalProducer<[Stock], NSError> {
    
    let resource = Resource<[Stock]>(path: pathFrom(market: market), method: .GET, requestBody: nil, headers: [:], parse: parseStocks)
    
    return fetchStockFromNetwork(resource)
}
