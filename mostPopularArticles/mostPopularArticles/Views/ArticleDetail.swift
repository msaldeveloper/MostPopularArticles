// ArticleDetail.swift
import SwiftUI

struct ArticleDetail: View {
    @ObservedObject var emailedViewModel: EmailedViewModel
    var article: [(String, URL?, String, String, String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack {
                Color.black
                HStack {
                    if let imageUrl = article.first?.1 {
                        AsyncImage(url: imageUrl) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(maxHeight: 250)
                                .padding()
                        } placeholder: {
                            ProgressView()
                                .frame(maxHeight: 200)
                        }
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                            .foregroundColor(.gray)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            Button {
                guard let imageUrl = article.first?.1 else {return}
                let article = Article(title: article.first?.0 ?? "", imageUrl: imageUrl, author: article.first?.2 ?? "", publishedDate: article.first?.3 ?? "", abstract: article.first?.4 ?? "")
                emailedViewModel.addToFavorites(article: article)

                print(emailedViewModel.favorites)

            } label: {
                Image(systemName: "heart")
                    .font(.system(size: 30))
                    .foregroundStyle(.red)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
            }
            .padding()

            Text(article.first?.2 ?? "")
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text(article.first?.0 ?? "title")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)

            Text(article.first?.4 ?? "")
                .font(.body)

            Text("Published on \(article.first?.3 ?? "")")
                .font(.footnote)
                .foregroundColor(.secondary)

            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
}
