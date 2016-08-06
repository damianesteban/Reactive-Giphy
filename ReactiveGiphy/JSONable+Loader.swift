//
//  JSONable+Loader.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol JSONLoader {
    func loadJSONFromFile(filename: String) -> JSON
    func jsonString(filename: String) -> String
}

extension JSONLoader {
    func loadJSONFromFile(filename: String) -> JSON {
        let path = NSBundle.mainBundle().pathForResource(filename, ofType:"json")
        let string = try! NSString(contentsOfFile: path!, usedEncoding: nil)
        let dataFromString = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        let json = JSON(data: dataFromString!)
        return json
    }
    
    func jsonString(filename: String) -> String {
        let path = NSBundle.mainBundle().pathForResource(filename, ofType:"json")
        let string = try! NSString(contentsOfFile: path!, usedEncoding: nil)
        return string as String
    }
}

protocol JSONable {
    static func fromJSON(json: JSON) -> Self
}
