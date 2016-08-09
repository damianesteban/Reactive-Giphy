//
//  TrendingGiphViewModel.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift

final class TrendingGiphyViewModel: InputValidator {
    
    // Input
    var searchText = PublishSubject<String>()
    let loading = Variable<Bool>(false)
    
    // Output
    lazy var giphs: Observable<[Giph]> = {
        return self.fetchTrendingGiphs()
    }()
    
    let activityIndicator = ActivityIndicator()
    
    // Private
    private let disposeBag = DisposeBag()
    private let networkService: GiphyAPIService
    
    // MARK: - Initializer
    init(giphyService: GiphyAPIService) {
        self.networkService = giphyService
    }
    
    // MARK: - InputValidator method
    func validateSearchText(text: String) -> Bool {
        return text.characters.count > 3 ? true : false
    }
    
    func fetchTrendingGiphs() -> Observable<[Giph]> {
        return GiphyProvider.request(.Trending)
            .trackActivity(self.activityIndicator)
            .observeOn(MainScheduler.instance)
            .debug()
            .mapJSON()
            .map { json in
                self.loading.value = true
                return Giph.arrayFromJSON(json)
        }
    }
}