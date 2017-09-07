//
//  ShopViewController.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-08-27.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ShopViewController: ButtonBarPagerTabStripViewController {
    
    @IBOutlet weak var TopBar: UIView!
    

    let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
//
//class ShopViewController: UIViewController {
    var Pages = [UIViewController]()

    var adress_variable = "test"
    var shop_name = "test"

    override func viewDidLoad() {
        
        TopBar.layer.shadowColor = UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        TopBar.layer.shadowOffset = CGSize(width: 0, height: 1.25)
        TopBar.layer.shadowRadius = 1.2
        TopBar.layer.shadowOpacity = 0.45

        //address.text = adress_variable
        
        //adress.text = adress_variable
        //Shop_name_outlet.text = shop_name
        
//        TODO: Code for Tabviews
        
        // change selected bar color
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = .white
        settings.style.selectedBarBackgroundColor = purpleInspireColor
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 5.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .white
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .black
            newCell?.label.textColor = self?.purpleInspireColor
        
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        
        self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))
        
        self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))
        
        self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))
        
        self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))
        
        self.Pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "child1"))
        
        Set_viewNames(pages: self.Pages)
        return self.Pages
    }
    
    
    func Set_viewNames(pages: [UIViewController]){
        let pages_size = pages.count
        var Pages_ChildController = [ChildViewController1]()
        for var i in (0..<pages_size){
            Pages_ChildController.append((pages[i] as? ChildViewController1)!)
        }
        for var i in (0..<pages_size){
            Pages_ChildController[i].View_title(Title: "\(i)")
        }
    
    }

}
