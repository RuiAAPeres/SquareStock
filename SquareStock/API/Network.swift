//
//  Network.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import ReactiveCocoa

let baseURL  = "https://squarestock.herokuapp.com/api/v2/"

func fetchStockFromNetwork (market : Market) -> SignalProducer<[Market], NSError>
{
    return SignalProducer { sink, disposable in
        NSURLConnection.sendAsynchronousRequest(urlRequest(market), queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
        }
    }
}

private func urlRequest (market : Market ) -> NSURLRequest
{
    let path : String
    
    switch market
    {
        case .NASDAQ100 : path = "nasdaq100"
    }
    
    return NSURLRequest(URL: NSURL(string: baseURL + path)!)
}
