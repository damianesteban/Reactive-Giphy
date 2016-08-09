//
//  TrendingCellViewModel.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/9/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation

class TrendingCellViewModel {
    
    private let urlString: String
    
    // Returns the url f the gif.
    var url: NSURL {
        guard let url = NSURL(string: urlString) else {
            fatalError("does not contain fixed width downsampled url")
        }
        return url
    }
    
    init(giph: Giph) {
        self.urlString = giph.urlString
    }
}