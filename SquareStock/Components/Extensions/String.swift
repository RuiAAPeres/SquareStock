//
//  String.swift
//  SquareStock
//
//  Created by Rui Peres on 05/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

public extension String {
    func localized () -> String {
        return NSLocalizedString(self, comment: "")
    }
}