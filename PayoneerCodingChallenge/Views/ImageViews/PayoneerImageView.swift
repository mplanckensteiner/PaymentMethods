//
//  PayoneerImageView.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/2/21.
//

import UIKit

class PayoneerImageView : UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.cornerRadius = 10
        
    }
    
    func downloadImage(fromURL url: String) {
        NetworkManager.shared.downloadImage(from: url) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
