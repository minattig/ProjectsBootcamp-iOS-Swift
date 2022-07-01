//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

protocol CoinManagerDelegate {
    func didCoinUpdate(_ coinManager: CoinManager, coin: )
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "60F21D91-9735-4189-85EC-643F845E06F0"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getPriceBitcoin(for currency: String) {
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let bitcoinPrice = self.parseJSON(safeData) {
                        self.delegate?.didCoinUpdate(self)
                    }
                }
            }
        }
    }
    
    func parseJSON (_ coinPrice: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decoderCoin = try
                decoder.decode(CoinData.self, from: coinPrice)
            let coin = decoderCoin.rate
            
            let priceCoin = CoinModel(coinRate: coin)
            return priceCoin
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
