//
//  JSONDecodable.swift
//  SquareStock
//
//  Created by Rui Peres on 06/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

protocol JSONDecodable {
    static func decode(json: JSON) -> Self?
}

