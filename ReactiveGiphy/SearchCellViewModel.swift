//
//  SearchCellViewModel.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/7/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa


class SearchCellViewModel {
    
    // Input
    let id: String
    let username: String
    let trendingDateString: String
    let ratingString: String
    let urlString: String
    
    // Output
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
    
    var hasTrended: Bool {
        switch trendingDateString {
        case "1970-01-01 00:00:00", "0000-00-00 00:00:00":
                return false
        default:
            return true
        }
    }
    
    var url: NSURL {
        guard let url = NSURL(string: urlString) else {
            fatalError("does not contain fixed width downsampled url")
        }
        return url
    }
    
    // MARK: - Initializer
    init(giph: Giph) {
        self.id = giph.id
        self.username = giph.username
        self.trendingDateString = giph.trendingDateString
        self.ratingString = giph.ratingString
        self.urlString = giph.urlString
    }
}
