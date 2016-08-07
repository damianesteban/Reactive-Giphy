//
//  SearchResultsCollectionViewCell.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/6/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import Kingfisher

class SearchResultsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var giphImageView: AnimatedImageView!
    @IBOutlet weak var trendedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trendedLabel.hidden = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: SearchCellViewModel) {
        giphImageView.kf_setImageWithURL(viewModel.url, placeholderImage: nil, optionsInfo: [.ForceRefresh, .Transition(ImageTransition.Fade(1))])
        if viewModel.hasTrended {
            trendedLabel.hidden = false
            print("trended")
        }
    }

}
