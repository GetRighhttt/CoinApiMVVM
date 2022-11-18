//
//  Splash.swift
//  CoinAPI
//
//  Created by Stefan Bayne on 11/17/22.
//

import SwiftUI

struct Splash: View {
    @State var animate = false
    @State var endSplash = false
    @State var degrees = 720.0
    
    var body: some View {
        ZStack {
            
            ContentView()
            
            ZStack {
                Color("background")
                Image(systemName: "bitcoinsign")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill : .fit)
                    .frame(width: animate ? nil : 130, height: animate ? nil : 130)
                    .foregroundColor(Color("universal"))
                
                    .scaleEffect(animate ? 3 : 1)
                    .frame(width: UIScreen.main.bounds.width)
                    .rotation3DEffect(.degrees(degrees), axis: (x: 0, y:1, z: 0))
            }
            .ignoresSafeArea()
            .onAppear(perform: animateSplash)
            .opacity(endSplash ? 0 : 1)
        }
    }
    
    func animateSplash() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
            
            withAnimation(Animation.easeOut(duration: 0.5)) {
                animate.toggle()
                self.degrees = 360
            }
            
            withAnimation(Animation.linear(duration: 0.95)) {
                endSplash.toggle()
                self.degrees = 360
            }
        }
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
