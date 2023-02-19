//
//  MainStackView.swift
//  ByteCoin
//
//  Created by Андрей Фроленков on 19.02.23.
//

import UIKit

class MainStackView: UIStackView {
    
    let nameCoin: UILabel = {
        let label = UILabel()
        label.text = "ByteCoin"
        label.font = .systemFont(ofSize: 50, weight: .thin)
        label.textAlignment = .center
        label.textColor = UIColor(named: "TitleColor")
        return label
    }()
    
    let backgroundViewStack: BackgroundViewStack = {
        let backgroundView = BackgroundViewStack()
        return backgroundView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .vertical
        distribution = .fillEqually
        alignment = .center
        spacing = 25
        translatesAutoresizingMaskIntoConstraints = false
        addAllSubview()
        settingConstraints()
    }
    
    private func addAllSubview() {
        
        addArrangedSubview(nameCoin)
        addArrangedSubview(backgroundViewStack)
        
    }
    
    func updateCoin(coin: CoinModel) {
        
        DispatchQueue.main.async { [weak self] in
            self?.backgroundViewStack.titleCoinStack.priceCoin.text = coin.coinString
            self?.backgroundViewStack.titleCoinStack.currency.text = coin.currensy
        }
        
    }
    
    private func settingConstraints() {
        
        NSLayoutConstraint.activate([
            nameCoin.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
