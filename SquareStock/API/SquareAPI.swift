//
//  SquareAPI.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import ReactiveCocoa

func fetchStock (market : Market) -> SignalProducer<[Market], NSError>
{
    return fetchStockFromNetwork(market)
}   