//
//  NewsResponse.swift
//  NewsApp
//
//  Created by Amissan on 30/11/2022.
//

import UIKit

struct NewsResponseModel: Decodable {
    var status: String?
    var totalResults: Int?
    var articles: [ArticleModel]?
}
