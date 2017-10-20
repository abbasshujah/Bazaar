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
    
//    @IBOutlet weak var searchBarView: UIView!
    @IBOutlet weak var nbHitsLabel: UILabel!
    @IBOutlet weak var TopBar: UIView!
    @IBOutlet weak var searchTextField: UIView!
    @IBOutlet weak var searchText: UITextField!
    
    
    var hitsController: HitsController!
    var searchController: UISearchController!
//    var jsonHits: JSONObject!
    
    var index: Index!
    var selected_item = "abcd"
    
    var product_name = [String]()
    
    var item_searched = ""
    //    var hitsCollectionView: HitsCollectionWidget!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shopItemSize = UIScreen.main.bounds.width/2 - 9
        
        let Layout = UICollectionViewFlowLayout()
        Layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6)
        Layout.itemSize = CGSize(width: shopItemSize, height: shopItemSize*140/100)
        
        Layout.minimumInteritemSpacing = 4
        Layout.minimumLineSpacing = 6
        
        collectionView.collectionViewLayout = Layout
        self.definesPresentationContext = true
//        self.extendedLayoutIncludesOpaqueBars = true
//        configureNavBar()
//        configureToolBar()
        configureSearchController()
        configureTable()
        configureInstantSearch()
        
        hitsController = HitsController(collection: collectionView)
        collectionView.dataSource = hitsController
        collectionView.delegate = hitsController
        hitsController.collectionDataSource = self
        searchText.text = item_searched
//        print(item_searched)
//        testAlgolia()

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
    
        performSegue(withIdentifier:"ItemClickedFromSearch", sender: indexPath)
        
    }
    
//    func testAlgolia(){
//
//        let query = Query(query: "pizza")
//        query.aroundLatLng = LatLng(lat: 43.261199, lng: -79.919054)
//        let apiClient = Client(appID: "HGQJBEYFM1", apiKey: "2d8d1f6517b669bd4ea3931f8bed2ce1")
//        index = apiClient.index(withName: "products")
//        index.search(query, completionHandler: { (res,error) in
//            print(res)
//
//        })
//        //           (43.261199, -79.919054)
//
//    }

    
    // MARK: Helper methods for configuring each component of the table
    
    func configureInstantSearch() {
        InstantSearch.shared.register(searchController: searchController)
        InstantSearch.shared.registerAllWidgets(in: self.view)
        InstantSearch.shared.updateSearchResults(for: searchController)
        InstantSearch.shared.searcher.params.aroundLatLng = LatLng(lat: 43.261199, lng: -79.919054)
        InstantSearch.shared.searcher.search()
    }
    
    func configureTable() {
        collectionView.delegate = self
//        collectionView.backgroundColor = UIColor.clear
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
//        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchBar.text = item_searched
        
//        searchController.searchBar.sizeToFit()
//        
//        searchController.searchBar.barTintColor = UIColor.clear
//        searchController.searchBar.isTranslucent = false
//        searchController.searchBar.layer.cornerRadius = 1.0
//        searchController.searchBar.clipsToBounds = true
////        searchBarView.addSubview(searchController.searchBar)
//        textFieldView.addSubview(searchController.searchBar)

    }
    
    @IBAction func GoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ItemClickedFromSearch"{
            let indexPath = collectionView.indexPathsForSelectedItems?.first
            let itemVC = segue.destination as! ShopItemViewController
            let cell = collectionView.cellForItem(at: indexPath!) as? SearchedItemCollectionViewCell
            
            itemVC.product_name = (cell?.item?.name!)!
            itemVC.product_price = (cell?.item?.price!)!
            
//            Converting URL to string to pass it to next view
            let imageURL_str = cell?.item?.imageUrl?.absoluteString
            itemVC.product_img_url = imageURL_str!
            itemVC.ItemCameFromSearch = true
            itemVC.ItemSearchedBeforeSelect = item_searched
            
            
//            let itemVC = segue.destination as! ShopItemViewController
//            itemVC.product_name = self.product_name[index.item]
//            print("............................................")
//            print(selected_item)
//            print("............................................")
        }
    }
}
