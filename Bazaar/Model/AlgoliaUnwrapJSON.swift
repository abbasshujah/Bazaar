//
//  ItemRecord.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-09-21.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

/*
    Structure to unwrap JSON search result from Algolia.
 
 
 */

import AlgoliaSearch
import InstantSearchCore
import Foundation

struct AlgoliaUnwrapJSON {
    private var json: JSONObject
    
    init(json: JSONObject) {
        self.json = json
    }
    
    var name: String? {
        return json["productName"] as? String
    }
    
    var store_name: String? {
        return json["StoreName"] as? String
    }
    
    var price: Double? {
      
        return json["price"] as? Double
    }
    
    var imageUrl: URL? {
        guard let urlString = json["productImage"] as? String else { return nil }
        return URL(string: urlString)
    }
    
//    var name_highlighted: String? {
//        return SearchResults.highlightResult(hit: json, path: "productName")?.value
//    }
    
    var lat: Double? {
        var locationJSON: JSONObject
        locationJSON = json["_geoloc"] as! JSONObject
        return locationJSON["lat"] as? Double
    }
    
    var lng: Double? {
        var locationJSON: JSONObject
        locationJSON = json["_geoloc"] as! JSONObject
        return locationJSON["lng"] as? Double
    }
    
}



/* Future Implementations:
 
 
 <----------Converts price from String to Double------>
 let str = json["price"]
 let formatter = NumberFormatter()
 formatter.numberStyle = .currency
 let number = formatter.number(from: str as! String)
 let amount = number?.doubleValue
 print(amount as! Double)
 return json["price"] as? Double
 
 
 
 */

