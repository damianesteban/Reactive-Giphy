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

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    private var viewModel: TrendingGiphyViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TrendingGiphyViewModel(giphyService: GiphyAPIService())
        
        viewModel.giphs
            .subscribeNext { value in
                print(value)
        }.addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

