//
//  Network.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import LlamaKit
import ReactiveCocoa


// MARK: Utility Classes

// Stolen from here: https://github.com/chriseidhof/github-issues/blob/master/FunctionalViewControllers/FunctionalViewControllers/APIClient.swift
enum Method: String { // Bluntly stolen from Alamofire
    case OPTIONS = "OPTIONS"
    case GET = "GET"
    case HEAD = "HEAD"
    case POST = "POST"
    case PUT = "PUT"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case TRACE = "TRACE"
    case CONNECT = "CONNECT"
}

let statusCodeIs2xx = { $0 >= 200 && $0 < 300}

struct Resource<A> : Printable {
    let path: String
    let method : Method
    let requestBody: NSData?
    let headers : [String:String]
    let parse: Result<NSData,NSError> -> Result<A,NSError>
    let validStatusCode : Int -> Bool
    
    var description : String {
        return path
    }
    
    init(path: String, method: Method, requestBody: NSData?, headers: [String:String], parse: Result<NSData,NSError> -> Result<A,NSError>) {
        self.path = path
        self.method = method
        self.requestBody = requestBody
        self.headers = headers
        self.parse = parse
        self.validStatusCode = statusCodeIs2xx
    }
    
    init(path: String, method: Method, requestBody: NSData?, headers: [String:String], validStatusCode: Int -> Bool, parse: Result<NSData,NSError> -> Result<A,NSError>) {
        self.path = path
        self.method = method
        self.requestBody = requestBody
        self.headers = headers
        self.parse = parse
        self.validStatusCode = validStatusCode
    }
    
}

// MARK: Request

let baseURL : NSURL = NSURL(string:"https://squarestock.herokuapp.com/api/v2/")!

func fetchStockFromNetwork (resource : Resource<[Stock]>) -> SignalProducer<[Stock], NSError> {
    let requestURL = baseURL.URLByAppendingPathComponent(resource.path)
    let request = NSURLRequest(URL:requestURL)
    
    return SignalProducer { sink, disposable in
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            
            if (error != nil) {
                sendError(sink, error.normalisedError(.NetworkError))
            }
            else {
                
            }
        }
    }
}

func pathFrom(#market : Market) -> String {
    switch market {
    case .NASDAQ100 : return "nasdaq100"
    }
}





