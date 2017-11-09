//
//  SearchedItemCollectionViewCell.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-09-07.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import CoreLocation


/*
     class sets attributes of a searched product such as price, shop name and name of the product to labels
 
 */
class SearchItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Shop: UILabel!
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var SearchedItemImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    
    static let placeholder = UIImage(named: "placeholder")
    
    var item: AlgoliaUnwrapJSON? {
        didSet {
            guard let item = item else { return }
            
            //Set Item name and shop name to labels
            Name.text = item.name
            Shop.text = item.store_name
            
            
            if let price = item.price {
                Price.text = "$\(String(describing: price))"
            }
            
            SearchedItemImage.cancelImageDownloadTask()

            
            if let url = item.imageUrl {
                SearchedItemImage.contentMode = .scaleAspectFit
                SearchedItemImage.setImageWith(url, placeholderImage: SearchItemCollectionViewCell.placeholder)
            } else {
                SearchedItemImage.image = SearchItemCollectionViewCell.placeholder
            }
            
/*............Showing Location for each product............. */
            let product_location: CLLocation = CLLocation(latitude: item.lat!, longitude: item.lng!)
            
            Distance.text = "\(round(MainViewController.Current_Location.distance(from: product_location)/10)/100)"
            
        }
    }
}
