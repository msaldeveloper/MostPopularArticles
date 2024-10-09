//
//  SplashScreen.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import SwiftUI

struct SplashScreen: View {
    @State var isActive = false
    
    var body: some View {
        if isActive {
            MenuView()
        }else {
            VStack {
                Image("logoNYT")
                    .resizable()
                    .scaledToFit()
                
                Text("Most Popular Articles").font(.title).padding(.top)
            }.onAppear(perform: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isActive = true
                }
            })
            
            .padding()
        }
        
    }
}

#Preview {
    SplashScreen()
}
