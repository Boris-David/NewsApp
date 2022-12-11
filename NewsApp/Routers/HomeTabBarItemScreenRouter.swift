//
//  HomeTabBarItemScreenRouter.swift
//  NewsApp
//
//  Created by Amissan on 08/12/2022.
//

import Foundation
import UIKit

struct HomeTabBarItemScreenRouter: Router {
    
    unowned var viewModel: HomeTabBarItemScreenViewModel
    
    init(viewModel: HomeTabBarItemScreenViewModel) {
        self.viewModel = viewModel
    }
    
    func route(to routeID: String, from context: UIViewController, parameters: Any?) {
        guard let route = HomeTabBarItemScreenViewController.Route(rawValue: routeID) else {
            // INVALID ROUTE PASSED
            return
        }
        switch route {
        case .articleDetail:
            guard let articlePressed = parameters as? ArticleModel else {
                return
                // CANNOT GET THE ARTICLE PRESSED
            }
            let articleDetailViewModel = ArticleDetailScreenViewModel()
            articleDetailViewModel.article = articlePressed
            
            let articleDetailVC = ArticleDetailScreenViewController(viewModel: articleDetailViewModel)

            articleDetailVC.router = ArticleDetailScreenRouter(viewModel: articleDetailViewModel)
            context.navigationController?.pushViewController(articleDetailVC, animated: false)
        }
    }
}
