//
//  ViewController.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        GiphyProvider.request(.Trending) { result in
            switch result {
            case let .Success(response):
                let jsonArray = JSON(data: response.data)["data"].arrayValue
                let giphs = jsonArray.flatMap { Giph.fromJSON($0) }
                print(giphs)
            case let .Failure(error):
                print(error)
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

