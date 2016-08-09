//
//  TrendingGiphCollectionViewCell.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/5/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import Kingfisher

class TrendingGiphCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animatibleImageView: AnimatedImageView!
    
    var viewModel: TrendingCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            animatibleImageView.kf_setImageWithURL(viewModel.url)
        }
    }
}
