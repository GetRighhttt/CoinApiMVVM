//
//  BottomSheetView.swift
//  CoinAPI
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

struct BottomSheetView: View {
    
    @StateObject var viewModel = ViewModel()
    var body: some View {
        
        ZStack {
            Color.init(uiColor: .lightGray).ignoresSafeArea()
            VStack {
                Text("**Cryto**")
                    .font(.largeTitle)
                HStack {
                    Image(systemName: "bitcoinsign")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 85)
                        .padding()
                        .font(.title2)
                    
                    Image(systemName: "bitcoinsign.circle")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 85)
                        .padding()
                        .font(.title2)

                    Image(systemName: "bitcoinsign.circle.fill")
                        .resizable()
                        .renderingMode(.original)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 85, height: 85)
                        .padding()
                        .font(.title2)
                }
                Text("**\(viewModel.searchText)**")
                    .padding()
                    .font(.title2)
                    .foregroundColor(Color("background"))
            }
            .foregroundColor(Color("universal"))
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView()
    }
}
