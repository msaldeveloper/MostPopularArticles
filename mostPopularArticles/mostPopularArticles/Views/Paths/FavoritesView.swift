//
//  sahredView.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import SwiftUI

struct FavoritesView: View {
    @StateObject private var emailedViewModel = EmailedViewModel()
    var body: some View {
        Text("Shared")
    }
   // emailedViewModel.favorites.contains(article) {
     //   emailedViewModel.removeFromFavorites(article: article)

}

#Preview {
    FavoritesView()
}
