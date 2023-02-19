//
//  CoinModel.swift
//  ByteCoin
//
//  Created by Андрей Фроленков on 19.02.23.
//

import Foundation

struct CoinModel {
    
    let rate: Double
    let currensy: String
    
    var coinString: String {
        return String(format: "%.2f", rate)
    }
}
