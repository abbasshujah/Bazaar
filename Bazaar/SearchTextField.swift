//
//  SearchTextField.swift
//  Bazaar
//
//  Created by shazia akhtar on 2017-09-02.
//  Copyright © 2017 Syed Abbas. All rights reserved.
//

import UIKit

@IBDesignable
class SearchTextField: UITextField {
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    func updateView(){
        if let image = rightImage {
            rightViewMode = .unlessEditing
            
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 36, height: 36))
        
            imageView.image = image
            
            rightView = imageView
        }
        else {
            //image is null
            rightViewMode = .never
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
