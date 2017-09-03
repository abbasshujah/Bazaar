//
//  ImageViewController.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-09-02.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class ImageViewController: UIViewController {
    
    static var imageCache = NSCache<AnyObject, AnyObject>()
    
    var url = ""
    
    @IBOutlet weak var img: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func showImage() {
////        TODO: Get Url from firebase
//        let ref = Database.database().reference()
//        ref.child("Basilique").child("StoreImage").observe(.value) { (snap: DataSnapshot) in
//            let url = snap.value as! String
//        }
    
//        img = ImageViewController.imageCache.object(forKey: url) as! UIImage
        
      
//        ref.child("Product Info").observe(.value) { (snapshot: DataSnapshot) in
//            let snapshotValue = snapshot.value as! String
//            self.showProductInfo.text = snapshotValue
//        }
//    }
}
