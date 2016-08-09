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
    
    var viewModel: SearchCellViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            giphImageView.kf_setImageWithURL(viewModel.url)
            
            if viewModel.hasTrended {
                hasTrendedLabel.hidden = false
                hasTrendedLabel.text = "TRENDED"
            } else {
                hasTrendedLabel.hidden = true
            }
            let username = viewModel.username.isEmpty ? "Anonymous" : viewModel.username
            usernameLabel.text = "POSTED BY: \(username)"
            ratingLabel.text = "RATING: \(viewModel.contentRating)"
        }
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
