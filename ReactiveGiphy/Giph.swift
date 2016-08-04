//
//  Giph.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Giph: JSONable {
    
    let id: String
    let username: String
    let urlString: String
    
    var url: NSURL {
        guard let url = NSURL(string: urlString) else {
            fatalError("does not contain fixed width downsampled url")
        }
        return url
    }
    
    static func fromJSON(json: JSON) -> Giph {
        let id = json["id"].stringValue
        let username = json["user"]["username"].stringValue
        let urlString = json["images"]["fixed_width_downsampled"]["url"].stringValue

        return Giph(id: id, username: username, urlString: urlString)
    }
}