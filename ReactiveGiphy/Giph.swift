//
//  Giph.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import SwiftyJSON

let epoch = NSDate.init(timeIntervalSince1970: 0)

enum ContentRating {
    case NoHoldsBarred
    case FamilyFriendly
}

struct Giph: JSONable {
    
    let id: String
    let username: String
    let urlString: String
    let rating: String
    private let trendingDateString: String
    
    var contentRating: ContentRating {
        switch rating {
        case "y", "z", "q":
            return .FamilyFriendly
        case "a", "x":
            return .NoHoldsBarred
        default:
            return .NoHoldsBarred
        }
    }
    
    private var trendedDate: NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        print(trendingDateString) 
        return dateFormatter.dateFromString(trendingDateString) ?? epoch
    }
    
    var hasTrended: Bool {
        return trendedDate.timeIntervalSince1970 > 0 ? true : false
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
        let rating = json["rating"].stringValue
        let trendingDateString = json["trending_datetime"].stringValue
        let urlString = json["images"]["fixed_width_downsampled"]["url"].stringValue

        return Giph(id: id, username: username, urlString: urlString, rating: rating,
                    trendingDateString: trendingDateString)
    }
    
    static func arrayFromJSON(object: AnyObject) -> [Giph] {
        let json = JSON(object)
        return json["data"].arrayValue.map {
            return Giph.fromJSON($0)
        }
    }
}