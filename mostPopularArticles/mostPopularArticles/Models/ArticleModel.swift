//
//  ArticleModel.swift
//  mostPopularArticles
//
//  Created by Mario Alberto Saldaña Martínez on 15/10/24.
//

import Foundation

struct Article: Codable ,Hashable {
    let title: String
    let imageUrl: URL?
    let author: String
    let publishedDate: String
    let abstract: String
}
