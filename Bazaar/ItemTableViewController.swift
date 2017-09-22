//
//  ItemTableViewController.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-09-21.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import InstantSearch
import AlgoliaSearch

class ItemTableViewController: UIViewController, UITableViewDelegate, HitsTableViewDataSource {
    
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var tableView: HitsTableWidget!
    @IBOutlet weak var searchBarNavigationItem: UINavigationItem!
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var nbHitsLabel: UILabel!
    
    var hitsController: HitsController!
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        self.extendedLayoutIncludesOpaqueBars = true
        configureNavBar()
        configureToolBar()
        configureSearchController()
        configureTable()
        configureInstantSearch()
        
        hitsController = HitsController(table: tableView)
        tableView.dataSource = hitsController
        tableView.delegate = hitsController
        hitsController.tableDataSource = self
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, containing hit: [String : Any]) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recordCell", for: indexPath) as! ItemCell
        
        cell.item = ItemRecord(json: hit)
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
    // MARK: Helper methods for configuring each component of the table
    
    func configureInstantSearch() {
        InstantSearch.shared.register(searchController: searchController)
        InstantSearch.shared.registerAllWidgets(in: self.view)
    }
    
    func configureTable() {
        tableView.delegate = self
        tableView.backgroundColor = UIColor.clear
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.barTintColor = UIColor.purple
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.blue]
    }
    
    func configureToolBar() {
        topBarView.backgroundColor = UIColor.white
    }
    
    func configureSearchController() {
        // Initialize and perform a minimum configuration to the search controller.
        searchController = UISearchController(searchResultsController: nil)
        
        searchController.dimsBackgroundDuringPresentation = false
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchBar.placeholder = "Bazaar"
        searchController.searchBar.sizeToFit()
        
        searchController.searchBar.barTintColor = UIColor.clear
        searchController.searchBar.isTranslucent = false
        searchController.searchBar.layer.cornerRadius = 1.0
        searchController.searchBar.clipsToBounds = true
        searchBarView.addSubview(searchController.searchBar)
    }
}
