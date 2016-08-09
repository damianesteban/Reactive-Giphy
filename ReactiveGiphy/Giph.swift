//
//  Giph.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift
import RxDataSources

enum ContentRating: String {
    case NoHoldsBarred
    case FamilyFriendly
}

struct Giph: JSONable {
    
    let id: String
    let username: String
    let urlString: String
    let ratingString: String
    let trendingDateString: String
    
    var contentRating: ContentRating {
        switch ratingString {
        case "y", "g", "pg", "pg-13":
            return .FamilyFriendly
        case "y", "g", "pg", "pg-13", "r", "":
            return .NoHoldsBarred
        default:
            return .NoHoldsBarred
        }
    }
    
    var url: NSURL {
        guard let url = NSURL(string: urlString) else {
            fatalError("does not contain fixed width downsampled url")
        }
        return url
    }
    
    static func fromJSON(json: JSON) -> Giph {
        let id = json["id"].stringValue
        let username = json["user"]["username"].stringValue
        let ratingString = json["rating"].stringValue
        let trendingDateString = json["trending_datetime"].stringValue
        let urlString = json["images"]["fixed_width_downsampled"]["url"].stringValue

        return Giph(id: id, username: username, urlString: urlString, ratingString: ratingString,
                    trendingDateString: trendingDateString)
    }
    
    static func arrayFromJSON(object: AnyObject) -> [Giph] {
        let json = JSON(object)
        return json["data"].arrayValue.map {
            return Giph.fromJSON($0)
        }
    }
}

extension Giph: IdentifiableType {
    var identity: String { return id }
}






