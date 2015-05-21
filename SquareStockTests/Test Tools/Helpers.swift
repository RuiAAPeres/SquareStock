//
//  Helpers
//  SquareStock
//
//  Created by Rui Peres on 20/05/2015.
//  Copyright (c) 2015 Rui Peres. All rights reserved.
//

import Foundation

func dataFromJSONFile(className : AnyClass,  file: String) -> NSData {
    let path = NSBundle(forClass: className.self).pathForResource(file, ofType: "json")!
    return NSData(contentsOfFile: path)!
}