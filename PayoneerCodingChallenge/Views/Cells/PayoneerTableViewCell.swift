//
//  PayoneerTableViewCell.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/2/21.
//

import UIKit

class PayoneerTableViewCell : UITableViewCell {
    
    static let reuseId = "PayoneerTableViewCell"
    
    private let paymentMethodImageView = PayoneerImageView(frame: .zero)
    private let paymentMethodName = PayoneerCustomLabel(textAlignment: .left, fontSize: 20)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(paymentMethod: Applicable) {
        paymentMethodImageView.downloadImage(fromURL: paymentMethod.links.logo)
        paymentMethodName.text = paymentMethod.label
    }
    
    private func configure() {
        addSubviews(paymentMethodImageView, paymentMethodName)
        
        let padding : CGFloat = 12
        let imageSize : CGFloat = 60
        
        NSLayoutConstraint.activate([
        
            paymentMethodImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            paymentMethodImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            paymentMethodImageView.heightAnchor.constraint(equalToConstant: imageSize),
            paymentMethodImageView.widthAnchor.constraint(equalToConstant: 80),
            
            
            paymentMethodName.leadingAnchor.constraint(equalTo: paymentMethodImageView.trailingAnchor, constant: padding),
            paymentMethodName.centerYAnchor.constraint(equalTo: paymentMethodImageView.centerYAnchor),
            paymentMethodName.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
