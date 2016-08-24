//
//  TrendingGiphCollectionViewCell.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/5/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class TrendingGiphCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animatibleImageView: AnimatedImageView!
    let disposeBag = DisposeBag()
    
    func rx_start(with giph: Giph) {
        // ViewModel is declared as a BehaviorSubject
        // http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#BehaviorSubject
        let viewModel = BehaviorSubject<TrendingCellViewModel>(value: TrendingCellViewModel(giph: giph))

        // Because our ViewModel is now a BehaviorSubject, we can subscribe to / transform
        // any of its attributes
        viewModel.map { (viewModel) -> NSURL in
            return viewModel.url
            }.subscribeNext { [weak self] url in
                guard let imageView = self?.animatibleImageView else { return }
                imageView.kf_setImageWithURL(url)
        }.addDisposableTo(disposeBag)
    }
}
