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

    var product_img_url = ""
    var product_name = ""
    @IBOutlet weak var Shop_Name: UILabel!
    var product_price = ""
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
        Price.text = product_price
        Shop_Name.text = shop_name
        loadProductImage()


        // Do any additional setup after loading the view.
    }
    
    func loadProductImage() {
        let url = URL(string: self.product_img_url)
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
    
//              TODO: Load up images and dont store in cache
            if error != nil {
                print("Failed fetching image:", error)
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Not a proper HTTPURLResponse or statusCode")
                return
            }
    
            DispatchQueue.main.async {
                self.productImageView.image = UIImage(data: data!)
            }
        }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoBackToShop(_ sender: Any) {
        performSegue(withIdentifier: "GoBackToShop", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoBackToShop"{
            let itemVC = segue.destination as! ShopViewController
            itemVC.shop_location = shop_location
            itemVC.shop_name = shop_name
        }
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
