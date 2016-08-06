//
//  GiphyAPIService.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift
import RxOptional

class GiphyAPIService {
    
    enum APIError: ErrorType {
        case ParseDataError
    }
    
    func fetchTrendingGiphs() -> Observable<[Giph]> {
        return GiphyProvider.request(.Trending)
            .observeOn(MainScheduler.instance)
            .debug()
            .mapJSON()
            .map { json in
                return Giph.arrayFromJSON(json)
        }
    }
    
    func fetchSearchResultsGiphs(query: String) -> Observable<[Giph]> {
        return GiphyProvider.request(.Search(query))
            .observeOn(MainScheduler.instance)
            .debug()
            .mapJSON()
            .map { json in
                return Giph.arrayFromJSON(json)
        }
    }
}