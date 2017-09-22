//
//  SearchedItemCollectionViewCell.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-09-07.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit

class SearchedItemCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var Shop: UILabel!
    @IBOutlet weak var Distance: UILabel!
    @IBOutlet weak var SearchedItemImage: UIImageView!
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Price: UILabel!
    
    static let placeholder = UIImage(named: "placeholder")
    
    var item: ItemRecord? {
        didSet {
            guard let item = item else { return }
            
            Name.highlightedText = item.name_highlighted
            Name.highlightedTextColor = UIColor.black
//            nameLabel.highlightedBackgroundColor = ColorConstants.lightYellowColor
            //            typeLabel.highlightedText = item.type_highlighted
            //            typeLabel.highlightedTextColor = UIColor.black
            //            typeLabel.highlightedBackgroundColor = ColorConstants.lightYellowColor
            
            if let price = item.price {
                Price.text = "$\(String(describing: price))"
                //                print(price)
                //                priceLabel.text = price
            }
            
            //            ratingView.settings.updateOnTouch = false
            //            if let rating = item.rating {
            //                ratingView.rating = Double(rating)
            //            }
            //
            SearchedItemImage.cancelImageDownloadTask()
            
            if let url = item.imageUrl {
                SearchedItemImage.contentMode = .scaleAspectFit
                SearchedItemImage.setImageWith(url, placeholderImage: SearchedItemCollectionViewCell.placeholder)
            } else {
                SearchedItemImage.image = SearchedItemCollectionViewCell.placeholder
            }
        }
    }
}

