//
//  ChildViewController1.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-08-30.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import XLPagerTabStrip
import UIKit

class ChildViewController1: UIViewController, IndicatorInfoProvider {
    var View_title = "saklskdfskjd"
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
}
