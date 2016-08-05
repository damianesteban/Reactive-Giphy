//
//  TrendingGiphCollectionViewCell.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/5/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import Gifu

class TrendingGiphCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var animatibleImageView: AnimatableImageView!
    
    func configure(with model: Giph) {
        guard let gifData = NSData(contentsOfURL: model.url) else { return }
        animatibleImageView.animateWithImageData(gifData)
    }
}
