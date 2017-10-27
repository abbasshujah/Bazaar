//
//  ItemCell.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-09-21.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import AFNetworking

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    //    @IBOutlet weak var ratingView: CosmosView!
    
    static let placeholder = UIImage(named: "placeholder")
    
    var item: ItemRecord? {
        didSet {
            guard let item = item else { return }
            
            nameLabel.highlightedText = item.name_highlighted
            nameLabel.highlightedTextColor = UIColor.black
//            nameLabel.highlightedBackgroundColor = ColorConstants.lightYellowColor
            //            typeLabel.highlightedText = item.type_highlighted
            //            typeLabel.highlightedTextColor = UIColor.black
            //            typeLabel.highlightedBackgroundColor = ColorConstants.lightYellowColor
            
            if let price = item.price {
                priceLabel.text = "$\(String(describing: price))"
                //                print(price)
                //                priceLabel.text = price
            }
            
            //            ratingView.settings.updateOnTouch = false
            //            if let rating = item.rating {
            //                ratingView.rating = Double(rating)
            //            }
            //
            itemImageView.cancelImageDownloadTask()
            
            if let url = item.imageUrl {
                itemImageView.contentMode = .scaleAspectFit
                itemImageView.setImageWith(url, placeholderImage: ItemCell.placeholder)
            } else {
                itemImageView.image = ItemCell.placeholder
            }
        }
    }
}
