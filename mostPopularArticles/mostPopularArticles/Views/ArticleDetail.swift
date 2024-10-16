// ArticleDetail.swift
import SwiftUI

struct ArticleDetail: View {
    var article: [(String, URL?, String, String, String)]

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ZStack{
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
