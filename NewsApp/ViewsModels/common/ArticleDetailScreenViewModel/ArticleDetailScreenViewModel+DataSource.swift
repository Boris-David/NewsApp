//
//  ArticleDetailScreenViewModel+DataSource.swift
//  NewsApp
//
//  Created by Amissan on 10/12/2022.
//

import Foundation

// Do not return a class to the view, because it is not his responsability.
// => Send all fields of the article instead
extension ArticleDetailScreenViewModel {
    func getArticle() ->
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
        let article = self.article!
        
        var articleTitleComponents = article.title?.components(separatedBy: "-")
        
        let articleSource = articleTitleComponents?.removeLast()
        let articleTitle = articleTitleComponents?.joined()
        
        let articlePublishedDate = getLocaleDateFromApiResponse(stringDate: article.publishedAt)
        
        return (sourceId: article.source?.id, sourceName: articleSource, author: article.author, title: articleTitle, description: article.articleDescription, url: article.url, urlToImage: article.urlToImage, publishedAt: articlePublishedDate, content: article.content)
    }
    
    private func getLocaleDateFromApiResponse(stringDate: String? = "") -> String {
        var publishedDate: String?
        
        guard let stringDate = stringDate else {
            return ""
        }
        let apiDateFormatter = DateFormatter()

        apiDateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        let articleDateWithApiTimeZone = apiDateFormatter.date(from: stringDate)
        
        let localeDateFormatter = DateFormatter()
        localeDateFormatter.dateStyle = .short
        localeDateFormatter.timeStyle = .short
        localeDateFormatter.dateFormat = "EEEE, d MMM yyyy à HH:mm"
        localeDateFormatter.locale = Locale(identifier: "fr")
        
        publishedDate = "Date de publication: \(localeDateFormatter.string(from: articleDateWithApiTimeZone!))"
        
        return publishedDate ?? ""
    }
    
}

