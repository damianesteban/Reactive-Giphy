//
//  SecondViewController.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/5/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import SwiftyJSON
import RxSwift
import RxCocoa
import Action

class SecondViewController: UIViewController {

    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    @IBOutlet weak var collectionView: UICollectionView!

    
    let disposeBag = DisposeBag()
    private var viewModel: SearchGiphViewModel!
    
    var searchText: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func bindViewModel() {
        viewModel = SearchGiphViewModel(giphyService: GiphyAPIService(), searchText: searchText)
        viewModel.giphs
            .bindTo(collectionView.rx_itemsWithCellIdentifier("cell", cellType: SearchResultsCollectionViewCell.self)) { (_, item, cell) in
                cell.configure(with: item)
        }.addDisposableTo(disposeBag)
        
        doneButton.rx_tap
            .subscribeNext { [weak self] in
                self?.dismissViewControllerAnimated(true, completion: nil)
        }.addDisposableTo(disposeBag)
        
    }

}
