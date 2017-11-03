//
//  ShopItemViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-09-04.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit

class ShopItemViewController: UIViewController {
    
    @IBOutlet weak var TopBar: UIView!
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var Price: UILabel!

    
    var ItemCameFromSearch = false
    var ItemSearchedBeforeSelect = ""
    
    var product_img_url = ""
    var product_name = ""
    @IBOutlet weak var Shop_Name: UILabel!
    var product_price: Double = 0
    var shop_location = ""
    var shop_name = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        TopBar.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        TopBar.layer.shadowOffset = CGSize(width: 0, height: 1.25)
        TopBar.layer.shadowRadius = 1.2
        TopBar.layer.shadowOpacity = 0.45
        
//        Loading up the info on the view
        Address.text = shop_location
        Address.numberOfLines = 0
        Address.sizeToFit()
        Name.text = product_name
        Name.numberOfLines = 0
        Name.sizeToFit()
//        Price.text = product_price
        Price.text = "$\(String(describing: product_price))"
        Shop_Name.text = shop_name
        loadProductImage()


        // Do any additional setup after loading the view.
    }
    
    func loadProductImage() {
//        let url = URL(string: self.product_img_url)
        
        if let url = URL(string: self.product_img_url) {
            self.productImageView.contentMode = .scaleAspectFit
            self.productImageView.setImageWith(url, placeholderImage: ChildViewController1.placeholder)
        } else {
            self.productImageView.image = ChildViewController1.placeholder
        }
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//    
////              TODO: Load up images and dont store in cache
//            if error != nil {
//                print("Failed fetching image:", error)
//                return
//            }
//            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                print("Not a proper HTTPURLResponse or statusCode")
//                return
//            }
//    
//            DispatchQueue.main.async {
//                self.productImageView.image = UIImage(data: data!)
//            }
//        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoBackToShop(_ sender: Any) {
        dismiss(animated: true, completion: nil)
//        if ItemCameFromSearch == true{
//            performSegue(withIdentifier: "BackToSearchFromItem", sender: self)
//        }
//        else{
//            performSegue(withIdentifier: "GoBackToShop", sender: self)
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoBackToShop"{
            let itemVC = segue.destination as! ShopViewController
            itemVC.shop_location = shop_location
            itemVC.shop_name = shop_name
        }
        if segue.identifier == "BackToSearchFromItem"{
            // do stuff here
        }
        if segue.identifier == "ToShopFromItemInfo"{
            let itemVC = segue.destination as! ShopViewController
            itemVC.shop_location = shop_location
            itemVC.shop_name = shop_name
        }

    }
    
    @IBAction func visitStore(_ sender: Any) {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
