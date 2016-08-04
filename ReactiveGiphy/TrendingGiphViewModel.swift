//
//  TrendingGiphViewModel.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import RxSwift

final class TrendingGiphyViewModel {
    
    private let disposeBag = DisposeBag()
    private let giphyAPIService: GiphyAPIService
    
    let giphs: Observable<[Giph]>
    
    init(giphyService: GiphyAPIService) {
        self.giphyAPIService = giphyService
        giphs = giphyService.fetchTrendingGiphs()
    }
}