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
    
    @IBOutlet weak var Address: UILabel!

    var shop_location = ""
    var product_name = ""
    var product_img_url = ""
    var product_price = ""
    var shop_name = ""
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        TopBar.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        TopBar.layer.shadowOffset = CGSize(width: 0, height: 1.25)
        TopBar.layer.shadowRadius = 1.2
        TopBar.layer.shadowOpacity = 0.45
        
        Address.text = "ajhsghjdad hjagjdhash jbdasbjbashb dasdjsbjdbj hsdbjh sbdfjhbsd fhsdfbsdh"
        Name.text = "skhf jksdnfknjksd jksjkfnjksbnbvbvnbvbnvbvbnvbvbnvvvvvvvvvvv ggggggggg ggghhhhhhhhhggg  ggggggggggggd kjnsjf kjnsd jknsjndfjk jsnjkfnjsdn jsnfnsk"
        Address.numberOfLines = 0
        Address.sizeToFit()
        Name.numberOfLines = 0
        Name.sizeToFit()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func GoBackToShop(_ sender: Any) {
        performSegue(withIdentifier: "GoBackToShop", sender: self)
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
