//
//  ShopItemViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-09-04.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit

class ShopItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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
