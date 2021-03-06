//
//  Network.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation
import Result

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
}

// MARK: Request

func request <A>(baseURL : NSURL, resource : Resource <A>, completion : Result <A, NSError> -> ())  {
    
    let requestURL = baseURL.URLByAppendingPathComponent(resource.path)
    let request = NSURLRequest(URL:requestURL)

    NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
        completion(resource.parse(result(data, error)))
    }
}

