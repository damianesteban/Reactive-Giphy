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
import Action

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchTextBar: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    
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
        
        
        let validSearchText = searchTextBar
            .rx_text
            .map { self.viewModel.validateSearchText($0) }
            .shareReplay(1)
        
        validSearchText
            .map { valid in
                return valid ? UIColor.greenColor() : UIColor.clearColor()
            }.subscribeNext { [weak self] color in
                self?.searchTextBar.layer.borderColor = color.CGColor
            }.addDisposableTo(disposeBag)
        
        validSearchText
            .bindTo(searchButton.rx_enabled)
            .addDisposableTo(disposeBag)
        
        // TODO: take another look at the Action library.
        //        let action: Action<String, Bool> = Action(enabledIf: validSearchText, workFactory: { input in
        //            return viewModel.validateSearchText(input)
        //        })
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextViewController = segue.destinationViewController as! SecondViewController
        nextViewController.searchText.value = searchTextBar.text ?? ""
    }
    
}













