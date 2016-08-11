//
//  JSONable+Loader.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift
import Moya

enum ReactiveGiphyError: String {
    case ParseJSONError
    case MissingDataError
}

extension ReactiveGiphyError: ErrorType {}

extension Observable {
    typealias Dictionary = JSON
    
    // pass JSONified data back to objects
    func mapToObject<T: JSONable>(classType: T.Type) -> Observable<T> {
        return self.map { json in
            guard let dict = json as? JSON else {
                throw ReactiveGiphyError.ParseJSONError
            }
            
            return T.fromJSON(dict)
        }
    }
    
    func mapToObjectArray<T: JSONable>(classType: T.Type) -> Observable<[T]> {
        return self.map { json in
            guard let array = json as? JSON else {
                throw ReactiveGiphyError.ParseJSONError
            }
            
            let dicts = array.arrayValue
            
            return dicts.map { T.fromJSON($0) }
        }
    }
}

// Loads JSON from a file for testing
protocol JSONLoader {
    func loadJSONFromFile(filename: String) -> JSON
    func jsonString(filename: String) -> String
}

// Convenience extension
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

// Returns an instance of the conforming type from JSONO
protocol JSONable {
    static func fromJSON(json: JSON) -> Self
    static func arrayFromJSON(object: AnyObject) -> [Self]
}

