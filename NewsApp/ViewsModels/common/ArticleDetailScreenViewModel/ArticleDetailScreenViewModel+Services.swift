//
//  ArticleDetailScreenViewModel+Services.swift
//  NewsApp
//
//  Created by Amissan on 10/12/2022.
//

import Foundation
import UIKit

extension ArticleDetailScreenViewModel {
    
    func redirectToFullArticle(urlString: String? = "") {
        
        guard let articleURL = URL(string: urlString!) else {
            // Something went wrong
            return
        }
        
        guard UIApplication.shared.canOpenURL(articleURL) else {
            // Cannot open URL
            return
        }
        UIApplication.shared.open(articleURL)
    }
}
