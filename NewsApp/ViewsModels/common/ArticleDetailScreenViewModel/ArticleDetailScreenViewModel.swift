//
//  ArticleDetailScreenViewModel.swift
//  NewsApp
//
//  Created by Amissan on 10/12/2022.
//

import Foundation

class ArticleDetailScreenViewModel {
    weak var delegate: ViewRequestsDelegate?
    var state: ViewState {
        didSet {
            delegate?.didUpdate(with: state)
        }
    }
    var article: ArticleModel?
    
    init() {
        self.state = .idle
    }
}
