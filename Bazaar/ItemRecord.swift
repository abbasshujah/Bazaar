//
//  ItemRecord.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-09-21.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//


import AlgoliaSearch
import InstantSearchCore
import Foundation

struct ItemRecord {
    private var json: JSONObject
    //    private let MAX_BEST_SELLING_RANK = 32691;
    
    init(json: JSONObject) {
        self.json = json
    }
    
    var name: String? {
        return json["productName"] as? String
    }
    
    //    var type: String? {
    //        return json["type"] as? String
    //    }
    
    //    var category: String? {
    //        return json["category"] as? String
    //    }
    
    var price: Double? {
        
        let str = json["price"]
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let number = formatter.number(from: str as! String)
        let amount = number?.doubleValue
        //        print(amount as! Double)
        return amount as? Double
        
    }
    
    
    //    var rating: Int? {
    //        return json["rating"] as? Int
    //    }
    
    var imageUrl: URL? {
        guard let urlString = json["productImage"] as? String else { return nil }
        return URL(string: urlString)
    }
    
    var name_highlighted: String? {
        return SearchResults.highlightResult(hit: json, path: "productName")?.value
    }
    
    //    var category_highlighted: String? {
    //        return SearchResults.highlightResult(hit: json, path: "category")?.value
    //    }
    //
    //    var type_highlighted: String? {
    //        return SearchResults.highlightResult(hit: json, path: "type")?.value
    //    }
}

