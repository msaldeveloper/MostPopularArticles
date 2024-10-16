//
//  mostPopularArticlesTests.swift
//  mostPopularArticlesTests
//
//  Created by Mario Alberto Saldaña Martínez on 16/10/24.
//

@testable import mostPopularArticles
import XCTest

final class mostPopularArticlesTests: XCTestCase {
    var emailedViewModel: EmailedViewModel!

    override func setUpWithError() throws {
        emailedViewModel = EmailedViewModel()
        UserDefaults.standard.removeObject(forKey: "Favorites")
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        UserDefaults.standard.removeObject(forKey: "Favorites")
        emailedViewModel = nil
        try super.tearDownWithError()
    }

    func testAddToFavorites() {
        let article = Article(title: "test", imageUrl: URL(string: "https://unsplash.com/es/fotos/texto-klMii3cR9iI"), author: "mario", publishedDate: "16/10/24", abstract: "este es un test case")

        emailedViewModel.addToFavorites(article: article)
        XCTAssertTrue(emailedViewModel.favorites.contains(article), "El articulo esta en la lista de favoritos")
    }

    func testRemoveFromFavorites() {
        let article = Article(title: "test", imageUrl: URL(string: "https://unsplash.com/es/fotos/texto-klMii3cR9iI"), author: "mario", publishedDate: "16/10/24", abstract: "este es un test case")

        emailedViewModel.removeFromFavorites(article: article)
        XCTAssertFalse(emailedViewModel.favorites.contains(article), "El articulo no esta en la lista de favoritos")
    }

    func testSaveFavorites() {
        let article = Article(title: "test", imageUrl: URL(string: "https://unsplash.com/es/fotos/texto-klMii3cR9iI"), author: "mario", publishedDate: "16/10/24", abstract: "este es un test case")

        emailedViewModel.addToFavorites(article: article)

        guard let savedData = UserDefaults.standard.data(forKey: "Favorites"),
              let decodedFavorites = try? JSONDecoder().decode([Article].self, from: savedData) else {
            XCTFail("Los favoritos no se guardaron correctamente en UserDefaults")
            return
        }

        XCTAssertTrue(decodedFavorites.contains(article), "El artículo guardado debería estar en UserDefaults")
    }

    func testLoadFavorites() {
        let article = Article(title: "test", imageUrl: URL(string: "https://unsplash.com/es/fotos/texto-klMii3cR9iI"), author: "mario", publishedDate: "16/10/24", abstract: "este es un test case")

        if let encodedData = try? JSONEncoder().encode([article]) {
            UserDefaults.standard.set(encodedData, forKey: "Favorites")
        }

        emailedViewModel = EmailedViewModel()

        XCTAssertTrue(emailedViewModel.favorites.contains(article), "El artículo debería haberse cargado desde UserDefaults")
    }
}
