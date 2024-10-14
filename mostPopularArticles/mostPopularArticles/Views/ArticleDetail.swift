//
//  ArticleDetail.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 13/10/24.
//

import SwiftUI

struct ArticleDetail: View {
    var articleData: [(String, URL?, String, String, String)]
    
    var body: some View {
        
        VStack{
            
            ZStack{
                Color.black
                    .background()
                    .frame(height: 200)
                HStack(alignment: .center, spacing: 10) {
                    
                    if let url = articleData.first?.1 {
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100)
                                .clipShape(Circle())
                                .overlay(
                                        Circle()
                                            .stroke(.white, lineWidth: 2)
                                    )
                                .padding()
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

                    Text(articleData.first?.0 ?? "title")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .padding()
                        .multilineTextAlignment(.center)
                }
                
            }.padding(.top, -150)
            
            Text(articleData.first?.3 ?? "date").padding(.top, 20)
            Text(articleData.first?.2 ?? "author")
            Text(articleData.first?.4 ?? "abstract")
                .multilineTextAlignment(.center)
                .padding()
            
            
        }
        
    }
}


