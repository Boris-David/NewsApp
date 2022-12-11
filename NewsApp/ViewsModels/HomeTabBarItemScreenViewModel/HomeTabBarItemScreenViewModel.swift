//
//  HomeTabBarItemViewModel.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import UIKit

class HomeTabBarItemScreenViewModel {
    weak var delegate: ViewRequestsDelegate?
    var state: ViewState {
        didSet {
            delegate?.didUpdate(with: state)
        }
    }
    var articles: [ArticleModel] = []
    
    init() {
        // at the init, the view model is in idle mode
        self.state = .idle
    }
}
