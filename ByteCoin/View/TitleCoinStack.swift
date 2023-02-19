//
//  TitleCoinStack.swift
//  ByteCoin
//
//  Created by Андрей Фроленков on 19.02.23.
//

import UIKit

class TitleCoinStack: UIStackView {
    
    let coinImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bitcoinsign.circle.fill")
        imageView.tintColor = UIColor(named: "IconColor")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let priceCoin: UILabel = {
        let label = UILabel()
        label.text = "..."
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .right
        label.textColor = .white
        return label
    }()
    
    let currency: UILabel = {
        let label = UILabel()
        label.text = "USD"
        label.font = .systemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        axis = .horizontal
        distribution = .fill
        alignment = .fill
        spacing = 10
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addAllSubview()
        settingConstraints()
    }
    
    private func addAllSubview() {
        
        addArrangedSubview(coinImage)
        addArrangedSubview(priceCoin)
        addArrangedSubview(currency)
    }
    
    private func settingConstraints() {
        
        NSLayoutConstraint.activate([
            coinImage.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
