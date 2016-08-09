//
//  SearchGiphViewModel.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/6/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RxDataSources

class SearchGiphViewModel {

    // Input
    var searchText = Variable<String>("")
    
    // Output
    let activityIndicator = ActivityIndicator()
    
    lazy var giphs: Observable<[Giph]> = {
        return self.fetchSearchResultsGiphs()
    }()
    
    // MARK - Initializer
    init(searchText: Variable<String>) {
        self.searchText = searchText
    }
    
    // Fetches search results from the giphy API
    func fetchSearchResultsGiphs() -> Observable<[Giph]> {
        return GiphyProvider.request(.Search(searchText.value))
            .trackActivity(self.activityIndicator)
            .observeOn(MainScheduler.instance)
            .debug()
            .mapJSON()
            .map { json in
                return Giph.arrayFromJSON(json)
        }
    }
    
    // Filters Giphs by ContentRating
    func filterGiphsByContentRating(giphs: Observable<[Giph]>) -> Observable<[Giph]> {
        return giphs
            .map {
                $0.filter { $0.contentRating == .FamilyFriendly }
        }
    }
}