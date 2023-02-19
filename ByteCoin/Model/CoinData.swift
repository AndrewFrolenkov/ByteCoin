//
//  CoinData.swift
//  ByteCoin
//
//  Created by Андрей Фроленков on 19.02.23.
//

import Foundation

struct CoinData: Codable {
    
    let asset_id_quote: String
    var currensy: String {
        return asset_id_quote
    }
    let rate: Double
}
