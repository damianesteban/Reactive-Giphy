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
    let trendingDateString: String
    let rating: String
    
    
    var url: NSURL {
        guard let url = NSURL(string: urlString) else {
            fatalError("does not contain fixed width downsampled url")
        }
        return url
    }
    
    static func fromJSON(json: JSON) -> Giph {
        let id = json["id"].stringValue
        let username = json["user"]["username"].stringValue
        let rating = json["rating"].stringValue
        let trendingDateString = json["trending_datetime"].stringValue
        let urlString = json["images"]["fixed_width_downsampled"]["url"].stringValue

        return Giph(id: id, username: username, urlString: urlString, trendingDateString: trendingDateString,
                rating: rating)
    }
    
    static func arrayFromJSON(object: AnyObject) -> [Giph] {
        let json = JSON(object)
        return json["data"].arrayValue.map {
            return Giph.fromJSON($0)
        }
    }
}