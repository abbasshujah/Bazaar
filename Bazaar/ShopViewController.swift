//
//  ShopViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-08-27.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//
import UIKit
import XLPagerTabStrip
import Firebase

class ShopViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var TopBar: UIView!
    @IBOutlet weak var SearchField: UITextField!
    
    
    @IBOutlet weak var tabviewBar: ButtonBarView!
    let purpleInspireColor = UIColor(red:1/255.0, green:142/255.0, blue:77/255.0, alpha:1.0)
    //
    //class ShopViewController: UIViewController {
    var Pages = [UIViewController]()
    var view_titles = [String]()
    
    var adress_variable = "test"
    var shop_name = ""
    var shop_location = ""
    var ref: DatabaseReference!
    var databaseHandle: DatabaseHandle?
    var city = "Hamilton"
    
    override func viewDidLoad() {
        
        
        TopBar.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        TopBar.layer.shadowOffset = CGSize(width: 0, height: 1.25)
        TopBar.layer.shadowRadius = 1.2
        TopBar.layer.shadowOpacity = 0.45
        
//        self.buttonBarView.delegate = self
//        self.buttonBarView.dataSource = self
//        

        ref = Database.database().reference()
        //address.text = adress_variable
        
        //adress.text = adress_variable
        //Shop_name_outlet.text = shop_name
        
        //        TODO: Code for Tabviews
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemBackgroundColor = purpleInspireColor
        settings.style.selectedBarBackgroundColor = .white
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 5.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .white
            newCell?.label.textColor = .white
            
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        SearchField.addTarget(self, action: #selector(enterPressed), for: .editingDidEndOnExit)
        //SearchField.clearsOnBeginEditing = true
        
        ref.child(city).child(shop_name).observeSingleEvent(of: .value, with: { (snapshot) in
            if let productCategories = snapshot.childSnapshot(forPath: "Products").children.allObjects as? [DataSnapshot]{
                for productCategory in productCategories{
                    self.view_titles.append(productCategory.key)
                }
            }
            
//                print(self.view_titles.count)
            self.reloadPagerTabStripView()
            
        })
        
//        print(databaseHandle)
        

//        print(self.view_titles)
    }
    
    func enterPressed(){
        //do something with typed text if needed
        print(SearchField.text ?? "")
        SearchInput(Input: SearchField.text!)
        //SearchField.resignFirstResponder()
        
    }
    
    func SearchInput(Input: String){
        if(Input == "test"){
            performSegue(withIdentifier:"ItemSearchedFromShop", sender: self)
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoBackToMain(_ sender: Any) {
        performSegue(withIdentifier: "ToMainFromShop", sender: self)
    }
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ItemSearchedFromShop"{
//            let shopVC = segue.destination as! ItemSearchedViewController
//            shopVC.Back_button_tag = "BackToShopFromItemSearch"
//        }
    }
    
//    func getProductCategories(){
//       
//        databaseHandle = ref.child(shop_name).observe(.value, with: { (snapshot: DataSnapshot) in
//            if let productCategories = snapshot.childSnapshot(forPath: "Products").children.allObjects as? [DataSnapshot]{
//                for productCategory in productCategories{
//                    self.view_titles.append(productCategory.key)
//                }
//            }
////            self.TopBar.reloadInputViews()
//        })
////        print(self.view_titles)
//    }
//    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
//        print(self.view_titles.count)
        
        
//        for var i in (0..<self.view_titles.count){
//            self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))
//        }
        
        
        if(self.view_titles.count != 0){
            
            Pages = [] // making the array to start from 0 all the time
            
            for var i in (0..<self.view_titles.count){
                self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))
            }
            
        } else{
            self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))

        }
        
        Set_viewNames(pages: self.Pages)
        return self.Pages
    }
    
    
    func Set_viewNames(pages: [UIViewController]){
//        let pages_size = pages.count
        var Pages_ChildController = [ChildViewController1]()
        for var i in (0..<self.view_titles.count){
            Pages_ChildController.append((pages[i] as? ChildViewController1)!)
        }
        for var i in (0..<self.view_titles.count){
            Pages_ChildController[i].View_title(Title: "\(self.view_titles[i])", Shop: shop_name, Shop_location: shop_location)
        }
        
    }
    
    
    
    
    
    
    
    
    
}
