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

/*
 Actions:
 
 - Filter giphs based on rating
 - Display giph title
 - fetch giphs
 */

class SearchGiphViewModel {
    
    // Input:
    let searchText: String
    // let filterGiphsObservable: PublishSubject<Bool>
    
    // Output:
    let giphs: Observable<[Giph]>
    // let titleObservable: Observable<String>
    
    // Private
    private let disposeBag = DisposeBag()
    private let networkService: GiphyAPIService
    
    // MARK: - Initializer
    init(giphyService: GiphyAPIService, searchText: String) {
        self.networkService = giphyService
        self.searchText = searchText
        giphs = giphyService.fetchSearchResultsGiphs(searchText)
        print("I'm being initialized")
    }
}