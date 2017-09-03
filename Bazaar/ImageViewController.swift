//
//  ImageViewController.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-09-02.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

//import Foundation
import UIKit
import Firebase
import Alamofire

class ImageViewController: UIViewController {
    
    static var imageCache = NSCache<AnyObject, AnyObject>()
    
    var request: Request?
    
    var url = ""
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showImage() {
//        TODO: Get Url from firebase
        
        let ref = Database.database().reference()
        ref.child("ShoopersDrugMart").child("StoreImage").observe(.value) { (snap: DataSnapshot) in
            self.url = snap.value as! String
            print(self.url)
//            imgView.image = [UIImage ]
            
//            let urlString = "https://pbs.twimg.com/profile_images/780881863497752576/f1NgnOP8.jpg"
            
//            TODO: Show the image on imageview
            guard let url = URL(string: self.url) else { return }
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print("Failed fetching image:", error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    print("Not a proper HTTPURLResponse or statusCode")
                    return
                }
                
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)
                }
            }.resume()
            
        }
        


        
        
        
//        img = ImageViewController.imageCache.object(forKey: url) as! UIImage
//        var url2 = NSURL.fileURL(withPath: self.url)
//        var data = NSData.init(contentsOf: url2)
//        var im = UIImage(data: data)
    }
}
