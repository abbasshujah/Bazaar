//
//  ShopViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-08-27.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit

class ShopViewController: UIViewController {
    
    
    
    
    var adress_variable = "test"
    var shop_name = "test"
    
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print ("trying to print")
        print (shop_name)
        //address.text = adress_variable
        
        //adress.text = adress_variable
        //Shop_name_outlet.text = shop_name
        
        
        
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
