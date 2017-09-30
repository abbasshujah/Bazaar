//
//  ItemCollectionViewController.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-09-21.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//
import UIKit
import InstantSearch
import AlgoliaSearch

class ItemSearchedViewController: UIViewController, UICollectionViewDelegate, HitsCollectionViewDataSource {
    
    @IBOutlet weak var collectionView: HitsCollectionWidget!
    @IBOutlet weak var topBarView: UIView!
    //    @IBOutlet weak var tableView: HitsTableWidget!
    
    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var nbHitsLabel: UILabel!
    
    var hitsController: HitsController!
    var searchController: UISearchController!
    var jsonHits: JSONObject!
    
    var selected_item = "abcd"
    
    var product_name = [String]()
    //    var hitsCollectionView: HitsCollectionWidget!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.definesPresentationContext = true
        self.extendedLayoutIncludesOpaqueBars = true
        configureNavBar()
        configureToolBar()
        configureSearchController()
        configureTable()
        configureInstantSearch()
        
        hitsController = HitsController(collection: collectionView)
        collectionView.dataSource = hitsController
        collectionView.delegate = hitsController
        hitsController.collectionDataSource = self
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath, containing hit: [String : Any]) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchedItem", for: indexPath) as! SearchedItemCollectionViewCell
        
        cell.item = ItemRecord(json: hit)
        self.product_name.append(hit["productName"] as! String)
//        print(hit["productName"] as! String)
        cell.backgroundColor = UIColor.white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath, containing hit: [String : Any]) {
        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchedItem", for: indexPath) as! SearchedItemCollectionViewCell
//        
//        cell.item = ItemRecord(json: hit)
//        print("................................")
//        print(cell.item)
//        print("................................")
        performSegue(withIdentifier:"ItemClickedFromSearch", sender: indexPath)
        
    }

    
    // MARK: Helper methods for configuring each component of the table
    
    func configureInstantSearch() {
        InstantSearch.shared.register(searchController: searchController)
        InstantSearch.shared.registerAllWidgets(in: self.view)
    }
    
    func configureTable() {
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.clear
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemClickedFromSearch"{
            let indexPath = collectionView.indexPathsForSelectedItems?.first
            let itemVC = segue.destination as! ShopItemViewController
            let cell = collectionView.cellForItem(at: indexPath!) as? SearchedItemCollectionViewCell
            
            itemVC.product_name = cell?.item?.name as! String
            itemVC.product_price = cell?.item?.price as! Double
            
            
//            let itemVC = segue.destination as! ShopItemViewController
//            itemVC.product_name = self.product_name[index.item]
//            print("............................................")
//            print(selected_item)
//            print("............................................")
        }
    }
}
