//
//  ChildViewController1.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-08-30.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import XLPagerTabStrip
import UIKit

class ChildViewController1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, IndicatorInfoProvider {
    
    var image = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    var location = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    var name = ["pinks", "religion 5", "relgion 7", "religion 5", "relgion 7", "religion 5", "relgion 7", "rlgion 7", "relgion 7", "relgion 7"]
    
    @IBOutlet weak var ShopItemCollectionView: UICollectionView!
    
    
    var View_title = "saklskdfskjd"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.ShopItemCollectionView.delegate = self
        self.ShopItemCollectionView.dataSource = self
    
        let shopItemSize = UIScreen.main.bounds.width/2 - 9
        
        let Layout = UICollectionViewFlowLayout()
        Layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6)
        Layout.itemSize = CGSize(width: shopItemSize, height: shopItemSize*125/100)
        
        Layout.minimumInteritemSpacing = 4
        Layout.minimumLineSpacing = 6
        
        ShopItemCollectionView.collectionViewLayout = Layout
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func View_title(Title: String){
        View_title = Title
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    
        return IndicatorInfo(title: "\(View_title)")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopItemCell", for: indexPath) as! ShopItemCollectionViewCell
        cell.ShopProductImage.image = UIImage(named: image[indexPath.row])
        cell.ShopProductPrice.text = name[indexPath.row]
        cell.ShopProductDiscription.text = location[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        performSegue(withIdentifier:"ShopItemDetails", sender: indexPath)
        
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "ShopItemDetails"{
//            let index = sender as! NSIndexPath
//            let itemVC = segue.destination as! ShopItemViewController
//            itemVC.product_name = location[index.item]
//            shopVC.shop_name = name[index.item]
//        }
//    }

    
}
