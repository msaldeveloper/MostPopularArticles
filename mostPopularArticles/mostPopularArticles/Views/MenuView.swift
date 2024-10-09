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
            emailedView().tabItem {
                Text("Emailed")
                Image(systemName: "mail.stack.fill")
            }
            sharedView().tabItem {
                Text("Shared")
                Image(systemName: "shared.with.you")
            }
            viewedView().tabItem {
                Text("Viewed")
                Image(systemName: "eye.fill")
            }
        }
    }
}

#Preview {
    MenuView()
}
