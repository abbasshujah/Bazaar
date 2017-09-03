//
//  ChildViewController2.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-08-30.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ChildViewController2: UIViewController, IndicatorInfoProvider {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "child 2")
    }
    
}
