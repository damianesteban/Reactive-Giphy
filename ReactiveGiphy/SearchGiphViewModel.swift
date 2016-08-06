//
//  SearchGiphViewModel.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/6/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift

/*
    Actions:
 
        - Filter giphs based on rating
        - Display giph title
        - fetch giphs
 */

class SearchGiphViewModel {

    // Input:
    let searchTextObservable: PublishSubject<String>
    let filterGiphsObservable: PublishSubject<Bool>
    
    // Output:
    let giphs: Observable<[Giph]>
    let titleObservable: Observable<String>


    // Private
    private let disposeBag = DisposeBag()
    private let giphyAPIService: GiphyAPIService
    
    // MARK: - Initializer
    init(giphyService: GiphyAPIService) {
        self.giphyAPIService = giphyService
        giphs = giphyService.fetchTrendingGiphs()
    }


}