//
//  Crypto.swift
//  CoinAPI
//
//  Created by Stefan Bayne on 11/17/22.
//

import Foundation

struct Crypto: Codable {
    let asset_id_base: String
    let rates: [Rate]
}

struct Rate: Codable, Identifiable {
    let id = UUID()
    let time: String
    let assets_id_quotes: String
    let rate: Double
    
    /*
     good to always provide sample of dummy data
     */
    
    static var sampleRates: [Rate] {
        var tempRates = [Rate]()
        
        for _ in 1...3000 {
            let randomNumber = Double(Array(0...1000).randomElement()!)
            let randomCurrency = ["FAMU", "GRS", "ROFL", "BTC", "LMAO", "LOL"].randomElement()!
            
            let sampleRate = Rate(time: "032432,32e3", assets_id_quotes: randomCurrency,
                                  rate: randomNumber)
            tempRates.insert(sampleRate, at: 0)
        }
        return tempRates
    }
    
}
