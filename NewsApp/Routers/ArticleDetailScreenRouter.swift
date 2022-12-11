//
//  ArticleDetailScreenRouter.swift
//  NewsApp
//
//  Created by Amissan on 08/12/2022.
//

import Foundation
import UIKit

struct ArticleDetailScreenRouter: Router {
        
    unowned var viewModel: ArticleDetailScreenViewModel
    
    init(viewModel: ArticleDetailScreenViewModel) {
        self.viewModel = viewModel
    }
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        // Nothing for the MVP
    }
    
}
