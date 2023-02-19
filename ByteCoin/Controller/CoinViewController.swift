//
//  CoinViewController.swift
//  ByteCoin
//
//  Created by Андрей Фроленков on 19.02.23.
//

import UIKit

class CoinViewController: UIViewController {
    
    let currencyPicker: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        return pickerView
    }()
    
    let mainStackView: MainStackView = {
        let stackView = MainStackView()
        return stackView
    }()
    
    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.currencyPicker.dataSource = self
        self.currencyPicker.delegate = self
        coinManager.delegate = self
        self.view.backgroundColor = UIColor(named: "BackgroundColor")
        addAllSubview()
        settingConstraints()
    }
    
    private func addAllSubview() {
        
        self.view.addSubview(mainStackView)
        self.view.addSubview(currencyPicker)
    }
    
    private func settingConstraints() {
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            currencyPicker.trailingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.trailingAnchor),
            currencyPicker.leadingAnchor.constraint(equalTo: self.view.layoutMarginsGuide.leadingAnchor),
            currencyPicker.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            currencyPicker.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
}

// MARK: - UIPickerViewDataSource, UIPickerViewDelegateUIPickerViewDataSource, UIPickerViewDelegate

extension CoinViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currensy = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: currensy)
    }
    
}

// MARK: - CoinManagerDelegate

extension CoinViewController: CoinManagerDelegate {
    
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel) {
        
        mainStackView.updateCoin(coin: coin)
    }
    
    func didFailWithError(error: Error) {
        print(error.localizedDescription)
    }
}
