//
//  SearchGiphViewModel.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/6/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift
import RxOptional
import RxCocoa
import RxDataSources

class SearchGiphViewModel {

    // Input
    var searchText = Variable<String>("")
    
    // Output
    let giphData: Observable<[Giph]>
    let filteredGiphData: Observable<[Giph]>
    
    // Private
    private let provider: GiphyAPIService
    
    // MARK - Initializer
    init(searchText: Variable<String>, provider: GiphyAPIService) {
        self.searchText = searchText
        self.provider = provider
        giphData = provider.fetchSearchResultsGiphs(searchText.value)
        filteredGiphData = provider.fetchSearchResultsGiphs(searchText.value)
    }
    
    func fetchSearchResultsGiphs(query: String) -> Observable<[Giph]> {
        return GiphyProvider.request(.Search(query))
            .debug()
            .mapJSON()
            .map { json in
                return Giph.arrayFromJSON(json)
        }
    }
    
    func filterGiphsByContentRating(giphs: Observable<[Giph]>) -> Observable<[Giph]> {
        return giphData
            .map {
                $0.filter { $0.contentRating == .FamilyFriendly }
        }
    }
}