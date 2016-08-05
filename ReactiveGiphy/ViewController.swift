//
//  ViewController.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let disposeBag = DisposeBag()
    private var viewModel: TrendingGiphyViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        viewModel = TrendingGiphyViewModel(giphyService: GiphyAPIService())
        viewModel.giphs
            .bindTo(collectionView.rx_itemsWithCellIdentifier("cell",
                cellType: TrendingGiphCollectionViewCell.self)) { (_, item, cell) in
                cell.configure(with: item)
        }.addDisposableTo(disposeBag)
    }
}

