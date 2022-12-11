//
//  HomeTabBarItemScreenViewModel+DataSource.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import UIKit

// DATA SOURCE
extension HomeTabBarItemScreenViewModel {

    var numberOfArticles: Int {
        return articles.count
    }
    
    // Do not return a class to the view, because it is not his responsability.
    // => Send all fields of the article instead
    func getArticle(for indexPath: IndexPath) ->
    (
        sourceId: String?,
        sourceName: String?,
        author: String?,
        title: String?,
        description: String?,
        url: String?,
        urlToImage: String?,
        publishedAt: String?,
        content: String?
    ) {
        let article = articles[indexPath.row]
        
        return (sourceId: article.source?.id, sourceName: article.source?.name, author: article.author, title: article.title, description: article.articleDescription, url: article.url, urlToImage: article.urlToImage, publishedAt: article.publishedAt, content: article.content)
    }
    
}

