//
//  ViewModel.swift
//  CoinAPI
//
//  Created by Stefan Bayne on 11/17/22.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    
    @Published var rates = [Rate]()
    @Published var searchText = ""
    @Published var amount: Double = 100
    
    // a way to filter the rates that we get back.
    var filteredRates: [Rate] {
        return searchText == "" ? rates : rates.filter { $0.assets_id_quotes.contains(searchText.uppercased()) }
    }
    
    // this is where we are going to refresh the list of data.
    func refreshData() {
        CryptoApi().fetchCryptoData(currency: "USD", previewMode: false) { newRates in
            DispatchQueue.main.async {
                withAnimation(.easeIn(duration: 0.1)) {
                    self.rates = newRates
                }
                print("Successfully got new rates: \(self.rates.count)")
            }
        }
    }
    
    // this is where we calculate the rate of the exchange
    func calculateRate(rate: Rate) -> Double {
        return amount * rate.rate
    }
}

