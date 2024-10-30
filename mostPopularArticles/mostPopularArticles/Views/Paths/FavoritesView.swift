//
//  sahredView.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 09/10/24.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var emailedViewModel: EmailedViewModel
    // @StateObject private var emailedViewModel = EmailedViewModel()
    var body: some View {
        VStack {
            Text("Favorites").font(.title)
            NavigationStack {
                ScrollView {
                    ForEach(Array(emailedViewModel.favorites), id: \.self) { article in
                        NavigationLink {
                            ArticleDetail(emailedViewModel: emailedViewModel, article: [(article.title, article.imageUrl, article.author, article.publishedDate, article.abstract)])
                        } label: {
                            HStack(alignment: .center, spacing: 10) {
                                if let url = article.imageUrl {
                                    AsyncImage(url: url) { image in
                                        image
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                    } placeholder: {
                                        ProgressView() // Indicador de carga mientras se descarga la imagen
                                    }
                                } else {
                                    Image(systemName: "photo") // Imagen por defecto si no hay URL
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .foregroundColor(.gray)
                                }

                                ZStack {
                                    Rectangle().foregroundStyle(.clear)
                                    Text(article.title)
                                        .font(.headline)
                                        .padding()
                                        .background(Color.gray.opacity(0.2))
                                        .cornerRadius(8)
                                        .frame(width: 250)
                                }

                                Button {
                                    let article = Article(title: article.title, imageUrl: article.imageUrl, author: article.author, publishedDate: article.publishedDate, abstract: article.abstract)

                                    if emailedViewModel.favorites.contains(article) {
                                        emailedViewModel.removeFromFavorites(article: article)
                                    }

                                    print(emailedViewModel.favorites)

                                } label: {
                                    Image(systemName: "heart.slash")
                                        .font(.system(size: 30))
                                        .foregroundStyle(.red)
                                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                                }

                            }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10))
                        }
                    }
                }
            }
        }
    }
}
