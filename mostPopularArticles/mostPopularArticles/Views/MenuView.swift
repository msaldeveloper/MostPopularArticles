//
//  MenuView.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var emailedViewModel = EmailedViewModel()
    @ObservedObject private var  session = Session()

    var body: some View {
        TabView {
            EmailedView(session: session, emailedViewModel: emailedViewModel)
                .tabItem {
                    Label("Emailed", systemImage: "envelope")
                }

            FavoritesView(emailedViewModel: emailedViewModel)
                .tabItem {
                    Label("Favorites", systemImage: "star")
                }
        }
    }
}

#Preview {
    MenuView()
}
