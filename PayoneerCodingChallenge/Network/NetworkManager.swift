//
//  NetworkManager.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/2/21.
//

import UIKit


class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://raw.githubusercontent.com/optile/checkout-android/develop/shared-test/lists/listresult.json"
    let cache = NSCache<NSString, UIImage>()
        
    //MARK: - Get Payment Methods
    func getPaymentMethods(onCompletion: @escaping(Result<[Applicable], ErrorMessage>) -> Void) {
        
        guard let url = URL(string: baseURL) else {
            onCompletion(.failure(.invalidData))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            if let _ = error {
                onCompletion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                onCompletion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                onCompletion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let paymentMethodsList = try decoder.decode(PaymentMethods.self, from: data)
                onCompletion(.success(paymentMethodsList.networks.applicable))
            } catch{
                onCompletion(.failure(.invalidData))
            }
            
        }
        task.resume()
    }
    
    
    //MARK: - Download Image From URL
    func downloadImage(from urlString: String, onCompletion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            onCompletion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            onCompletion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard let self = self, error == nil,
                  let response = response as? HTTPURLResponse, response.statusCode == 200,
                  let data = data,
                  let image = UIImage(data: data) else {
                onCompletion(nil)
                return
            }
            self.cache.setObject(image, forKey: cacheKey)
            onCompletion(image)
        }
        task.resume()
    }
}
