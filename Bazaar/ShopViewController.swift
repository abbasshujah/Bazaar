//
//  ShopViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-08-27.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import XLPagerTabStrip

//class ShopViewController: ButtonBarPagerTabStripViewController {

//    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
//
class ShopViewController: UIViewController {
    

    var adress_variable = "test"
    var shop_name = "test"

    override func viewDidLoad() {
        
        
        
        print ("trying to print")
        print (shop_name)
        //address.text = adress_variable
        
        //adress.text = adress_variable
        //Shop_name_outlet.text = shop_name
        
//        TODO: Code for Tabviews
        
//        // change selected bar color
//        settings.style.buttonBarBackgroundColor = .white
//        settings.style.buttonBarItemBackgroundColor = .white
//        settings.style.selectedBarBackgroundColor = purpleInspireColor
//        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
//        settings.style.selectedBarHeight = 2.0
//        settings.style.buttonBarMinimumLineSpacing = 0
//        settings.style.buttonBarItemTitleColor = .black
//        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
//        settings.style.buttonBarLeftContentInset = 0
//        settings.style.buttonBarRightContentInset = 0
//        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
//            guard changeCurrentIndex == true else { return }
//            oldCell?.label.textColor = .black
//            newCell?.label.textColor = self?.purpleInspireColor
//        
//        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoBackToMain(_ sender: Any) {
        performSegue(withIdentifier: "GoBackToMain", sender: self)
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
