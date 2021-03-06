//
//  PayoneerCustomLabel.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/2/21.
//

import UIKit

class PayoneerCustomLabel : UILabel {
   
   override init(frame: CGRect) {
       super.init(frame: frame)
       
       configure()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
   
   convenience init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
       self.init(frame: .zero)
       self.textAlignment = textAlignment
       self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
   }
   
   private func configure() {
       textColor = UIColor(named: Colors.colorLabel)
       adjustsFontSizeToFitWidth = true
       minimumScaleFactor = 0.9
       translatesAutoresizingMaskIntoConstraints = false
   }
}
