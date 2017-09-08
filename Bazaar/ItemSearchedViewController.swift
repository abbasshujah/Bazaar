//
//  ItemSearchedViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-09-07.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit

class ItemSearchedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var Back_button_tag: String = ""
    
    
    @IBOutlet weak var SearchedItemsView: UICollectionView!
    
    
    @IBOutlet weak var TopBar: UIView!
    
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
        self.SearchedItemsView.delegate = self
        self.SearchedItemsView.dataSource = self
        
        let shopItemSize = UIScreen.main.bounds.width/2 - 9
        
        let Layout = UICollectionViewFlowLayout()
        Layout.sectionInset = UIEdgeInsetsMake(6, 6, 6, 6)
        Layout.itemSize = CGSize(width: shopItemSize, height: shopItemSize*160/100)
        
        Layout.minimumInteritemSpacing = 4
        Layout.minimumLineSpacing = 6
        
        SearchedItemsView.collectionViewLayout = Layout

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func BackButton(_ sender: Any) {
        performSegue(withIdentifier: self.Back_button_tag, sender: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchedItem", for: indexPath) as! SearchedItemCollectionViewCell
        cell.SearchedItemImage.image = UIImage(named: image[indexPath.row])
        cell.Name.text = name[indexPath.row]
        cell.Price.text = location[indexPath.row]
        cell.Shop.text = name[indexPath.row]
        cell.Distance.text = name[indexPath.row]
        return cell
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
