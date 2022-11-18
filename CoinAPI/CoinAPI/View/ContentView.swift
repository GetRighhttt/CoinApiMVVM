//
//  ContentView.swift
//  CoinAPI
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

// api-key : B8502FD3-9608-4940-983E-117C47A37687

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    @State var showSheet = false
    
    var body: some View {
        
        NavigationView {
            ZStack{
                Color("background").ignoresSafeArea()
                VStack {
                    VStack {// how we increment the amount.
                        Stepper("Amount: $\(Int(viewModel.amount))",
                                value: $viewModel.amount,
                                step: 100)
                        Slider(value: $viewModel.amount, in: 1...10_000) // this is how we add a slider to our view.
                    }.padding()
                    
                    List(viewModel.filteredRates) { item in
                        HStack() {
                            Text(item.assets_id_quotes)
                                .bold()
                                .foregroundColor(Color("universal"))
                            Spacer()
                            Text("\(viewModel.calculateRate(rate: item), specifier: "%.2f")")
                                .foregroundColor(Color("universal"))
                            
                            
                            Button(action: {
                                showSheet.toggle()
                            }) {
                                Image(systemName: "restart.circle")
                            }
                            .padding(.leading, 10)
                            .foregroundColor(Color("universal"))
                        }
                        .listRowBackground(Color("background"))
                        .listRowSeparatorTint(Color("universal"))
                        .listStyle(.insetGrouped)
                        .padding(.top, 8)
                        .sheet(isPresented: $showSheet) {
                            BottomSheetView()
                                .presentationDetents([.height(300), .large])
                        }
                    } // these make the list plain, and shows the searchText
                    .listStyle(.plain)
                    .searchable(text: $viewModel.searchText)
                    
                }
                .onAppear(perform: viewModel.refreshData)
                .navigationTitle("**CoinApi**")
                .toolbar {
                    ToolbarItem {
                        Button("Refresh", action: viewModel.refreshData)
                            .foregroundColor(Color("universal"))
                            .bold()
                    }
                }
            }.transition(.scale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
