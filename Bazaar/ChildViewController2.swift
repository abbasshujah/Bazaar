//
//  ChildViewController2.swift
//  Bazaar
//
//  Created by Prasann Pandya on 2017-08-30.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import Foundation
import UIKit
import XLPagerTabStrip

class ChildViewController2: UIViewController, IndicatorInfoProvider {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "child1")
    }
    
}
