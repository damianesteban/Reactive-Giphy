//
//  SearchResultsTableViewCell.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/8/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class SearchResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var giphImageView: AnimatedImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var hasTrendedLabel: UILabel!

    let disposeBag = DisposeBag()
    
    func rx_start(with giph: Giph) {
        // ViewModel is declared as a BehaviorSubject
        // http://www.introtorx.com/Content/v1.0.10621.0/02_KeyTypes.html#BehaviorSubject
        let viewModel = BehaviorSubject<SearchCellViewModel>(value: SearchCellViewModel(giph: giph))

        // Because our ViewModel is now a BehaviorSubject, we can subscribe to / transform
        // any of its attributes
        viewModel.map {
            if $0.hasTrended {
                return "TRENDED"
            } else {
                return ""
            }
        }
        .bindTo(hasTrendedLabel.rx_text)
        .addDisposableTo(disposeBag)

        
        viewModel.map { $0.contentRating }
            .bindTo(ratingLabel.rx_text)
            .addDisposableTo(disposeBag)
        
        viewModel.map {
            if $0.username.isEmpty {
                return "POSTED BY: ANONYMOUS"
            } else {
             return "POSTED BY: \($0.username)"
            }
        }
        .bindTo(usernameLabel.rx_text)
        .addDisposableTo(disposeBag)
        
        viewModel.map { (viewModel) -> NSURL in
            return viewModel.url
            }.subscribeNext { [weak self] url in
                guard let imageView = self?.giphImageView else { return }
                imageView.kf_setImageWithURL(url)
            }.addDisposableTo(disposeBag)
        }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = Constants.Colors.OffWhite
        hasTrendedLabel.textColor = Constants.Colors.Green
        ratingLabel.textColor = Constants.Colors.DarkGrey
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
