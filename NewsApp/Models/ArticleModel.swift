//
//  Article.swift
//  NewsApp
//
//  Created by Amissan on 30/11/2022.
//

import UIKit

struct ArticleModel: Decodable {
    var source: SourceModel?
    var author: String? // can be nil
    var title:  String?
    var articleDescription: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    // Explicitely define a different coding key for "description" because it is a swift keyword
    private enum CodingKeys: String, CodingKey {
        case source, author, title, articleDescription = "description", url, urlToImage, publishedAt, content
    }

    
}

