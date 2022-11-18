//
//  CryptoManager.swift
//  CoinAPI
//
//  Created by Stefan Bayne on 11/17/22.
//

import Foundation

final class CryptoApi {
    let API_KEY = "077477DE-A7C9-4262-840F-B43C8972ACBC"
    
    func fetchCryptoData(currency: String, previewMode: Bool, _ completion: @escaping ([Rate]) -> ()) {
        if previewMode {
            completion(Rate.sampleRates)
            return
        }
        
        // need to use string interpolation to pass in the currency of our choice.
        let urlString = "https://rest.coinapi.io//v1/exchangerate/\(currency)?apikey=\(API_KEY)"
        
        guard let url = URL(string: urlString) else {
            print("CryptoAPI: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                print("CryptoAPI: Could not return data.")
                return
            }
            
            do {
                let ratesData = try JSONDecoder().decode(Crypto.self, from: data)
                completion(ratesData.rates)
            } catch {
                print("CryptoAPI: \(error)")
                completion(Rate.sampleRates)
            }
        }
        .resume()
    }
}
