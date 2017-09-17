//
//  ChildViewController1.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-08-30.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//
import XLPagerTabStrip
import UIKit
import Firebase

class ChildViewController1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, IndicatorInfoProvider {
    
    var store_name = [String]()
    
    var product_name = [String]()
    
    var product_price = [String]()
    
    var product_img_url = [String]()
    
    var shop_name = ""
    
    var shop_location = ""
    
    var product_category = [String]()
    
    var image = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    var location = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    var name = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    @IBOutlet weak var ShopItemCollectionView: UICollectionView!
    
    var View_title = "test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        self.ShopItemCollectionView.delegate = self
        self.ShopItemCollectionView.dataSource = self
        
        let shopItemSize = UIScreen.main.bounds.width/2 - 9
        
        let Layout = UICollectionViewFlowLayout()
        Layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6)
        Layout.itemSize = CGSize(width: shopItemSize, height: shopItemSize*140/100)
        
        Layout.minimumInteritemSpacing = 4
        Layout.minimumLineSpacing = 6
        
        ShopItemCollectionView.collectionViewLayout = Layout
        loadProducts()
        
//        print(self.product_name)
        
//        print("we are in child view \(shop_name)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func View_title(Title: String, Shop: String, Shop_location: String){
        View_title = Title
        shop_name = Shop
        shop_location = Shop_location
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "\(View_title)")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(self.product_img_url)
        return self.product_name.count
//        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopItemCell", for: indexPath) as? ShopItemCollectionViewCell{
            
            let img_url = URL(string: self.product_img_url[indexPath.row])
            URLSession.shared.dataTask(with: img_url!) { (data, response, error) in
                
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
                    cell.ShopProductImage.image = UIImage(data: data!)
                }
                }.resume()
            
            
//            cell.ShopProductImage.image = UIImage(named: image[indexPath.row])
            cell.ShopProductPrice.text = self.product_price[indexPath.row]
            cell.ShopProductDiscription.text = self.product_name[indexPath.row]
//            cell.ShopProductPrice.text = name[indexPath.row]
//            cell.ShopProductDiscription.text = location[indexPath.row]
            return cell
        } else {
            return ShopItemCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier:"ShopItemDetails", sender: indexPath)
        
    }

    
    func loadProducts(){
        // TODO: Get image urls from firebase
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.child(shop_name).child("Products").child(View_title).observe(.value, with: { (snapshot: DataSnapshot) in
            self.product_name = []
            self.product_price = []
            self.product_img_url = []
            
            if let products = snapshot.children.allObjects as? [DataSnapshot]{
                
                for product in products{
                    self.product_name.append(product.childSnapshot(forPath: "productName").value as! String)
                    self.product_price.append(product.childSnapshot(forPath: "price").value as! String)
                    self.product_img_url.append(product.childSnapshot(forPath: "productImage").value as! String)
                }
            }
            
            self.ShopItemCollectionView.reloadData()
        })

        
    }

     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShopItemDetails"{
            let index = sender as! NSIndexPath
            let itemVC = segue.destination as! ShopItemViewController
            itemVC.product_img_url = self.product_img_url[index.item]
            itemVC.product_name = self.product_name[index.item]
            itemVC.product_price = self.product_price[index.item]
            itemVC.shop_location = shop_location
            itemVC.shop_name = shop_name
        }
     }
    

    
}
