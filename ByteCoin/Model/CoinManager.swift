//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Андрей Фроленков on 19.02.23.
//

import Foundation

protocol CoinManagerDelegate {
    
    func didUpdateCoin(_ coinManager: CoinManager, coin: CoinModel)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "YOUR_API_KEY_HERE"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    func getCoinPrice(for currency: String) {
        fetchCoin(coin: currency)
    }
    
    func fetchCoin(coin: String) {
        
        let urlString = "\(baseURL)/\(coin)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    self.delegate?.didFailWithError(error: error)
                    return
                }
            
                if let data = data {
                    if let coin = self.parseJSON(data) {
                        self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            }
            
            task.resume()
            
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let coin = CoinModel(rate: decodedData.rate, currensy: decodedData.currensy)
            return coin
        } catch {
            self.delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
