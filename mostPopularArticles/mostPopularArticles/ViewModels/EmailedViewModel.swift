//
//  EmailedViewModel.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 16/10/24.
//

import Foundation
import SwiftUI

class EmailedViewModel: ObservableObject {
    @Published var favorites: Set<Article> = []

    init() {
        loadFavorites()
    }

    // Function to add an article to favorites
    func addToFavorites(article: Article) {
        favorites.insert(article)
        saveFavorites()
    }

    // Function to remove an article from favorites
    func removeFromFavorites(article: Article) {
        favorites.remove(article)
        saveFavorites()
    }

    // Save the favorites to UserDefaults
    private func saveFavorites() {
        if let encodedData = try? JSONEncoder().encode(Array(favorites)) {
            UserDefaults.standard.set(encodedData, forKey: "Favorites")
        }
    }

    // Load the favorites from UserDefaults
    private func loadFavorites() {
        if let savedData = UserDefaults.standard.data(forKey: "Favorites"),
           let decodedData = try? JSONDecoder().decode([Article].self, from: savedData) {
            favorites = Set(decodedData)
        }
    }
    
}
