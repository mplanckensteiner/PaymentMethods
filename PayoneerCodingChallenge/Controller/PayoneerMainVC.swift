//
//  PayoneerMainVC.swift
//  PayoneerCodingChallenge
//
//  Created by Miguel Planckensteiner on 5/2/21.
//

import UIKit

class PayoneerMainVC: UIViewController {
    
    private var paymentMethods: [Applicable] = []
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPaymentMethodsList()
        configureUI()
        configureTableView()
    }

    private func configureUI() {
        view.backgroundColor = .systemBackground
        title = "Payment Methods"
    }
    
    private func configureTableView() {
     
        configureConstraint()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.backgroundColor = .systemBackground
        tableView.register(PayoneerTableViewCell.self, forCellReuseIdentifier: PayoneerTableViewCell.reuseId)
    }
    
    private func configureConstraint() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
}
//MARK: - UITableViewDelegate, UITableViewDataSource
extension PayoneerMainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paymentMethods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PayoneerTableViewCell.reuseId) as! PayoneerTableViewCell
        
        let paymentMethod = paymentMethods[indexPath.row]
        cell.configureCell(paymentMethod: paymentMethod)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK: - Functions

extension PayoneerMainVC {
    
    func getPaymentMethodsList() {
        NetworkManager.shared.getPaymentMethods() { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let fetchedData):
                DispatchQueue.main.async {
                    self.paymentMethods = fetchedData
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    AlertManager.presentAlert(title: "Something went wrong!", message: error.rawValue, actions: .tryAgain, from: self)
                }
            }
        }
    }
}
