//
//  MenuView.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView{
            EmailedView().tabItem {
                Text("Emailed")
                Image(systemName: "mail.stack.fill")
            }
            FavoritesView().tabItem {
                Text("FavoritesView")
                Image(systemName: "heart.fill")
            }
        }
    }
}

#Preview {
    MenuView()
}
