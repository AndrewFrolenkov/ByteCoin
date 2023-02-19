//
//  BackgroundViewStack.swift
//  ByteCoin
//
//  Created by Андрей Фроленков on 19.02.23.
//

import UIKit

class BackgroundViewStack: UIView {
    
    let titleCoinStack: TitleCoinStack = {
        let stack = TitleCoinStack()
        return stack
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .tertiaryLabel
        addSubview(titleCoinStack)
        
        
        
        settingConstraint()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = self.frame.height / 2
    }
    
    private func settingConstraint() {
        
        NSLayoutConstraint.activate([
            titleCoinStack.topAnchor.constraint(equalTo: self.topAnchor),
            titleCoinStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleCoinStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            titleCoinStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
