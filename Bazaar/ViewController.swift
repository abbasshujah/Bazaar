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
import CoreLocation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var SearchField: UITextField!
    
    @IBOutlet weak var SliderMenu: UIView!
    
    @IBOutlet weak var TopBar: UIView!
    
    @IBOutlet weak var AccountMenuLeading: NSLayoutConstraint!
    
    @IBOutlet weak var AccountMenuWidth: NSLayoutConstraint!
    
    @IBOutlet weak var ShopCollectionView: UICollectionView!
    
    static var imageCache = NSCache<AnyObject, AnyObject>()
    
    // Create request so we can cancel it when its not on screen
    var request: Request?
    
    var image_url = [String]()
    
    var store_name = [String]()
    
    var store_location = [String]()
    
    var store_clicked = ""
    
    var city = "Hamilton"
    
    var item_searched = ""
    
    var temp_string = ""
    
    var ref: DatabaseReference!
    
    let Manage_location = CLLocationManager()
    var Current_Location: CLLocation = CLLocation(latitude: 43.261199, longitude: -79.919054)
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        Uncomment this before uploading the app on any phone.
        //        TODO: Get current location
//        Current_Location = locations[0]
    }
    
    func GetLocation(location: String) {
        var adress_mcmaster = CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
            //            print("distance")
            
//            print("Store Location: \(location.coordinate.latitude),\(location.coordinate.longitude)")
//            print("Current Location: \(self.Current_Location.coordinate.latitude),\(self.Current_Location.coordinate.longitude)")
//            return
            //            print("\(self.Current_Location.coordinate.longitude)")
//            Getting store distance from current location in a format with two decimal places
//            print("\(round(self.Current_Location.distance(from: location)/10)/100)")
            
            self.temp_string = "\(round(self.Current_Location.distance(from: location)/10)/100)"
//            return self.temp_string
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthStatus()
        Manage_location.delegate = self
        Manage_location.startUpdatingLocation()
        
//        GetLocation(location: "16 Priscilla Lane, Hamilton, ON L8E 3K9")
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse{
            locationAuthStatus()
        }
    }
    
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            
        }
        else {
            Manage_location.requestWhenInUseAuthorization()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //------------------------------------------------
        //locationManager.delegate = self
        //locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //locationManager.startUpdatingLocation()
        
        //------------------------------------------------
        
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
        AccountMenuWidth.constant = ((shopItemSize * 3) / 2) + 9
        
        AccountMenuLeading.constant = -1 * (((shopItemSize * 3) / 2) + 50)
        
        SliderMenu.layer.shadowOpacity = 10
        SliderMenu.layer.shadowRadius = 20
        
        SearchField.addTarget(self, action: #selector(enterPressed), for: .editingDidEndOnExit)
        
//        To load store data
        loadStoreData()
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// TODO: Functions for search field
    func enterPressed(){
        //do something with typed text if needed
//        print(SearchField.text ?? "")
        SearchInput(Input: SearchField.text!)
        //SearchField.resignFirstResponder()
        
    }
    
    func SearchInput(Input: String){
        performSegue(withIdentifier:"ItemSearchedFromMain", sender: self)
        //if(Input == "test"){
        //  performSegue(withIdentifier:"ItemSearchedFromShop", sender: self)
        
        //}
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.image_url.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Shop_cell", for: indexPath) as? ShopCollectionViewCell{
//            var img: UIImage?
//            let url = URL(string: self.image_url[indexPath.row])
            
            //            TODO: Load up images and store it in cache
//            img = ViewController.imageCache.object(forKey: url as AnyObject) as? UIImage
            
            if let url = URL(string: self.image_url[indexPath.row]) {
                cell.Shop_image.contentMode = .scaleAspectFit
                cell.Shop_image.setImageWith(url, placeholderImage: ChildViewController1.placeholder)
            } else {
                cell.Shop_image.image = ChildViewController1.placeholder
            }
//            TODO: Another way to load up an image
            
//            URLSession.shared.dataTask(with: url!) { (data, response, error) in
//                
//                //              TODO: Load up images and dont store in cache
//                if error != nil {
//                    print("Failed fetching image:", error)
//                    return
//                }
//                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//                    print("Not a proper HTTPURLResponse or statusCode")
//                    return
//                }
//                
//                DispatchQueue.main.async {
//                    cell.Shop_image.image = UIImage(data: data!)
//                }
//                }.resume()
//            
            //            cell.Shop_image.image = UIImage(named: image[indexPath.row])
            
            cell.Shop_name.text = self.store_name[indexPath.row]
            
            var adress_mcmaster = CLGeocoder().geocodeAddressString(self.store_location[indexPath.row]) { (placemarks, error) in
                guard
                    let placemarks = placemarks,
                    let location = placemarks.first?.location
                    else {
                        return
                        
                }
                cell.Shop_adress.text = "\(round(self.Current_Location.distance(from: location)/10)/100)"
            }
            
//            cell.Shop_adress.text = ""
            //            cell.Shop_adress.text = self.store_location[indexPath.row]
            return cell
            
        } else{
            return ShopCollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier:"ToShopFromMain", sender: indexPath)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToShopFromMain"{
            let index = sender as! NSIndexPath
            let shopVC = segue.destination as! ShopViewController
            //            shopVC.adress_variable = location[index.item]
            shopVC.shop_name = store_name[index.item]
            shopVC.shop_location = store_location[index.item]
            
        }
        if segue.identifier == "ItemSearchedFromMain"{
            let itemVC = segue.destination as! ItemSearchedViewController
            itemVC.item_searched = SearchField.text!
        }
    }
    
    func loadStoreData(){
        // TODO: Get image urls from firebase
        self.ref = Database.database().reference()
        
        self.ref.child(city).observe(.value, with: { (snapshot: DataSnapshot) in
            
            if let snapshots = snapshot.children.allObjects as? [DataSnapshot] {
//            print(snapshots)
                
                //                print(snapshots)
                self.image_url = []
                self.store_name = []
                self.store_location = []
                
                for snap in snapshots{
//                    print("SNAP:\(snap)")
                    
                    self.image_url.append(snap.childSnapshot(forPath: "StoreImage").value as! String)
                    self.store_name.append(snap.childSnapshot(forPath: "StoreName").value as! String)
                    self.store_location.append(snap.childSnapshot(forPath: "StoreAddress").value as! String)
                    
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
        AccountMenuLeading.constant = -(((shopItemSize * 3) / 2) + 50)
        
        //AccountMenuWidth.constant = shopItemSize
        
        UIView.animate(withDuration: 0.3, animations: {
            self.view.layoutIfNeeded()
        })
    }
}
