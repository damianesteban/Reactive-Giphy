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

/*
 Actions:
 
 - Filter giphs based on rating
 - Display giph title
 - fetch giphs
 */

class SearchGiphViewModel {
    
    // Input:
    var searchText = Variable("")
    // let filterGiphsObservable: PublishSubject<Bool>
    
    // Output:
    lazy var giphs: Driver<[Giph]> = {
        return self.searchText.asObservable()
            .distinctUntilChanged()
            .flatMapLatest {
                self.fetchSearchResultsGiphs($0)
        }
            .asDriver(onErrorJustReturn: [])
    }()
    
    // Private
    private let disposeBag = DisposeBag()

    
    // MARK: - Initializer
    init(searchText: Variable<String>) {
        self.searchText = searchText
    }
    
    func fetchSearchResultsGiphs(query: String) -> Observable<[Giph]> {
        return GiphyProvider.request(.Search(query))
            .debug()
            .mapJSON()
            .map { json in
                return Giph.arrayFromJSON(json)
        }
    }
    

}