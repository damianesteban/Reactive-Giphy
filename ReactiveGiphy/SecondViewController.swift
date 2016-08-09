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
import RxDataSources

// Convenience struct for using RxDataSources.  There is a lot more you can do with SectionModels
// that has a lot of potential.
struct TableViewDataSource {
    static var models = [Giph]()
}

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterByRatingSwitch: UISwitch!
    
    let disposeBag = DisposeBag()
    
    // The dataSource and "data" for RxDataSource.
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Giph>>()
    let data = Variable([SectionModel(model: "Section 1", items: TableViewDataSource.models)])
    
    private var viewModel: SearchGiphViewModel!
    var searchText = Variable<String>("")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SET NAVBAR TITILE
        
        
        // Sets the switch value to false by default
        filterByRatingSwitch.on = false

        // Instiates our ViewModel
        viewModel = SearchGiphViewModel(searchText: searchText, provider: GiphyAPIService())
        
        // Configures the tableview's RxDataSource
        dataSource.configureCell = { _, tableView, indexPath, dataSourceItem in
            let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SearchResultsTableViewCell
            cell.viewModel = SearchCellViewModel(giph: dataSourceItem)
            return cell
        }
        
        // Binds (drives) the data of type Variable containing an array of SectionModels to the tableView
        data.asDriver()
            .drive(tableView.rx_itemsWithDataSource(dataSource))
            .addDisposableTo(disposeBag)
        
        //MARK: - Observables for RxDataSources
        // This can be refactored significantly.  I had never worked with RxDataSources before and
        // while it is awesomely powerful it is a bit tricky to work with at first.
        
        // Non-filtered giphs
        let giphsObservable = viewModel.giphData
            .map {
                let giphs = Variable<[Giph]>($0)
                self.data.value = [SectionModel(model: "", items: $0)]
                print("COUNT: \(giphs.value.count)")
            }.asObservable()
        
        // Filtered giphs
        let filteredGiphsObservable = viewModel.filterGiphsByContentRating(viewModel.giphData)
            .map {
                let filteredGiphs = Variable<[Giph]>($0)
                self.data.value = [SectionModel(model: "", items: $0)]
                print("COUNT: \(filteredGiphs.value.count)")
            }.asObservable()

        // MARK: - Filter state
        // Again, this can be refactored.  Usually when you have nested subscribe blocks it is a potential
        // code smell...I'm sure there is a cleaner way to handle this.  I plan on working with RxDataSources
        // quite a bit more to fully understand it.
        
        // I chose to use the Driver unit below as it is designed specifically for UI-related / main thread
        // operations.  See: https://github.com/ReactiveX/RxSwift/blob/master/Documentation/Units.md#driver-unit
        filterByRatingSwitch
            .rx_value
            .asDriver()
            .driveNext { [weak self] value in
                guard let `self` = self else { return }
                
                if value == true {
                    filteredGiphsObservable.subscribeNext { _ in
                        print("yay")
                    }.addDisposableTo(self.disposeBag)
                }
                
                if value == false {
                    giphsObservable.subscribeNext { _ in
                        print("yay")
                    }.addDisposableTo(self.disposeBag)
                }
            }.addDisposableTo(disposeBag)
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
