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
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showImage() {
        
        let ref = Database.database().reference()
        ref.child("Product Info").observe(.value) { (snapshot: DataSnapshot) in
            let snapshotValue = snapshot.value as! String
            self.showProductInfo.text = snapshotValue
        }
    }
}
