//
//  UIView+Ext.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/2/21.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }
}
