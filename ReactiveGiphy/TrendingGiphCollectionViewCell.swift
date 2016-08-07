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
    
    func configure(with model: Giph) {
        animatibleImageView.kf_setImageWithURL(model.url)
    }
}
