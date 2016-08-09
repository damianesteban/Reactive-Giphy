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

class TrendingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextBar: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    let disposeBag = DisposeBag()
    private var viewModel: TrendingGiphyViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        bindViewModel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Binds the viewModel and associated properties to the ViewController
    func bindViewModel() {
        viewModel = TrendingGiphyViewModel()
        
        // Binds the viewModel's giphs to the collection view
        viewModel.giphs
            .bindTo(collectionView.rx_itemsWithCellIdentifier("cell",
                cellType: TrendingGiphCollectionViewCell.self)) { (_, item, cell) in
                    cell.viewModel = TrendingCellViewModel(giph: item)
        }.addDisposableTo(disposeBag)
        
        
        // Observable
        let validSearchText = searchTextBar
            .rx_text
            .map { self.viewModel.validateSearchText($0) }
            .shareReplay(1)
        
        // Subscribes to observable to indicate to the user if they have entered enoug characters to
        // perform a search.
        validSearchText
            .map { valid in
                return valid ? Constants.Colors.Green: Constants.Colors.GreyDivider
            }.subscribeNext { [weak self] color in
                self?.searchButton.tintColor = color
            }.addDisposableTo(disposeBag)
        
        // Binds the value of the observable to the searchButton
        validSearchText
            .bindTo(searchButton.rx_enabled)
            .addDisposableTo(disposeBag)
        
        // Displays a UIActivityIndicator while a network request is in progress
        viewModel.activityIndicator
            .drive(activityIndicatorView.rx_animating)
            .addDisposableTo(disposeBag)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextViewController = segue.destinationViewController as! SearchResultsViewController
        nextViewController.searchText.value = searchTextBar.text ?? ""
    }
    
}

extension TrendingViewController {
    // MARK: - Convenience method
    func configureAppearance() {
        navigationItem.title = "Reactive Giphy"
        view.backgroundColor = Constants.Colors.WhiteAccent
        collectionView.backgroundColor = .blackColor()
        searchTextBar.layer.borderWidth = 2.0
        searchTextBar.layer.borderColor = Constants.Colors.OrangeAccent.CGColor
        searchTextBar.placeholder = "Enter your search term here!"
    }
}













