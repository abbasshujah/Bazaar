//
//  ViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-08-16.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var SliderMenu: UIView!
  
    @IBOutlet weak var TopBar: UIView!
    
    @IBOutlet weak var AccountMenuLeading: NSLayoutConstraint!
    
    @IBOutlet weak var AccountMenuWidth: NSLayoutConstraint!
    
    @IBOutlet weak var ShopCollectionView: UICollectionView!
    
    static var imageCache = NSCache<AnyObject, AnyObject>()
    
    // Create request so we can cancel it when its not on screen
    var request: Request?
    
    var image_urls = [String]()
    
    var store_names = [String]()
    
    var image = ["pinks", "TimHortons", "TimHortons", "Balilque", "TimHortons", "TimHortons", "Balilque", "Balilque", "Balilque", "TimHortons"]
    
    var location = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    var name = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TopBar.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        TopBar.layer.shadowOffset = CGSize(width: 0, height: 1.25)
        TopBar.layer.shadowRadius = 1.2
        TopBar.layer.shadowOpacity = 0.45
        
        // Do any additional setup after loading the view, typically from a nib.
        self.ShopCollectionView.delegate = self
        self.ShopCollectionView.dataSource = self
        
        let shopItemSize = UIScreen.main.bounds.width/2 - 9
        
        let Layout = UICollectionViewFlowLayout()
        Layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6)
        Layout.itemSize = CGSize(width: shopItemSize, height: shopItemSize*125/100)
        
        Layout.minimumInteritemSpacing = 4
        Layout.minimumLineSpacing = 6
        
        ShopCollectionView.collectionViewLayout = Layout
        AccountMenuWidth.constant = shopItemSize + 9
      
        AccountMenuLeading.constant = -1 * (shopItemSize + 50)
      
        SliderMenu.layer.shadowOpacity = 10
        SliderMenu.layer.shadowRadius = 20
        loadImages()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.image_urls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Shop_cell", for: indexPath) as? ShopCollectionViewCell{
            
            var img: UIImage?
            let url = URL(string: self.image_urls[indexPath.row])
            
//            TODO: Load up images and store it in cache
            img = ViewController.imageCache.object(forKey: url as AnyObject) as? UIImage
            
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
                    cell.Shop_image.image = UIImage(data: data!)
                }
            }.resume()
            
//                if img != nil{
//                    print("hehe")
//                    cell.Shop_image.image = img
//                    } else{
//
//                    if error != nil {
//                        print("Failed fetching image:", error)
//                        return
//                    }
//
//                    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                        print("Not a proper HTTPURLResponse or statusCode")
//                        return
//                    }
//
//                    DispatchQueue.main.async {
//                        let img = UIImage(data: data!)
//                        cell.Shop_image.image = img
//                        ViewController.imageCache.setObject(img!, forKey: url! as AnyObject)
//                    }
//                }
//            }.resume()

            
            
//            cell.Shop_image.image = UIImage(named: image[indexPath.row])
            
            cell.Shop_name.text = self.store_names[indexPath.row]
            cell.Shop_adress.text = location[indexPath.row]
            return cell
            
        } else{
            return ShopCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier:"Test", sender: indexPath)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Test"{
            let index = sender as! NSIndexPath
            let shopVC = segue.destination as! ShopViewController
            shopVC.adress_variable = location[index.item]
            shopVC.shop_name = name[index.item]
        }
    }
    
    func loadImages(){
  // TODO: Get image urls from firebase
        
        var ref: DatabaseReference!
        ref = Database.database().reference()
        
        ref.observe(.value, with: { (snapshot: DataSnapshot) in
            

            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
                
//                print(snapshots)
                self.image_urls = []
                self.store_names = []
                for snap in snapshots{
                    //print("SNAP:\(snap)")
//                    if let storeDict = snap.value as? Dictionary<String,AnyObject>{
////                        print(snap.value)
//                        self.store_names.append(snap.key)
//                    }
                    
                    let temp = snap.childSnapshot(forPath: "StoreImage")
                    self.image_urls.append(temp.value as! String)
                    
                }
            }
            self.ShopCollectionView.reloadData()
        })

    }
    
    @IBAction func OpenAccountMenu(_ sender: Any) {
        
        AccountMenuLeading.constant = 0
        
        //let shopItemSize = UIScreen.main.bounds.width/2
        
        //AccountMenuWidth.constant = shopItemSize
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })

    }
    @IBAction func CloseAccountMenu(_ sender: Any) {
    
        
        let shopItemSize = UIScreen.main.bounds.width/2
        AccountMenuLeading.constant = -(shopItemSize + 50)
        
        //AccountMenuWidth.constant = shopItemSize
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
}

