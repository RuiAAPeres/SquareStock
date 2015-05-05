//
//  Market.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

enum Market {
    case NASDAQ100
    
    var description : String {
        switch self {
        case .NASDAQ100 : return "NASDAQ100"
        }
    }
}