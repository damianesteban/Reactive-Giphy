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
    
    // Output
    let giphs: Observable<[Giph]>
    
    // Private
    private let disposeBag = DisposeBag()
    private let giphyAPIService: GiphyAPIService
    
    // MARK: - Initializer
    init(giphyService: GiphyAPIService) {
        self.giphyAPIService = giphyService
        giphs = giphyService.fetchTrendingGiphs()
    }
    
    // MARK: - InputValidator method
    func validateSearchText(text: String) -> Bool {
        return text.characters.count > 3 ? true : false
    }
    
    
}