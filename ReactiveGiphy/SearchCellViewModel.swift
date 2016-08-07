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
    
    let contentRating: ContentRating
    let hasTrended: Bool
    let url: NSURL
    
    let giph: Giph
    
    init(giph: Giph) {
        self.giph = giph
        self.contentRating = giph.contentRating
        self.hasTrended = giph.hasTrended
        self.url = giph.url
    }
}
