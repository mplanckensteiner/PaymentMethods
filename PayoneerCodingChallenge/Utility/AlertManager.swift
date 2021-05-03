//
//  AlertManager.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/3/21.
//

import UIKit

struct AlertManager {
    
    static func presentAlert(title: String?, message: String? , actions: AlertManager.Action..., from controller: UIViewController) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        for action in actions {
            alertController.addAction(action.alertAction)
        }
        
        controller.present(alertController, animated: true, completion: nil)
    }
}


extension AlertManager {
    
    enum Action {
        case tryAgain
        
        private var title: String {
            switch self {
            
            case .tryAgain:
                return "OK"
            }
        }
        
        private var handler: (() -> Void)? {
            switch self {
            case .tryAgain:
                return nil
            }
        }
        
        var alertAction: UIAlertAction {
            return UIAlertAction(title: title, style: .default, handler: { _ in
                if let handler = self.handler {
                    handler()
                }
            })
        }
    }
}
