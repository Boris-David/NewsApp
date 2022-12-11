//
//  HomeTabBarItemScreenViewModel+Services.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import UIKit

// Communication with Services (Networking)
extension HomeTabBarItemScreenViewModel {
    
    func loadNews() {
        self.state = .gettingData
        NewsService.getTopNewsOf(country: .fr, maxNumberOfResults: 50) {
            result in
            switch result {
            case .success(let articles):
                self.articles = articles
                self.state = .success
            case .failure(let error):
                self.articles = []
                self.state = .failure(error)
            }
        }
    }
}
