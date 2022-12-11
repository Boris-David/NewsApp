//
//  HomeTabBarItemScreenViewController+UITableView.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import Foundation
import UIKit

// UITableViewDelegate
extension HomeTabBarItemScreenViewController: UITableViewDelegate {
    
}

// UITableViewDataSource
extension HomeTabBarItemScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfArticles
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.register(UINib(nibName: XibIdentifiers.articleCell.rawValue, bundle: nil), forCellReuseIdentifier: TableViewCellIdentifiers.articleTableViewCellIdentifier.rawValue)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifiers.articleTableViewCellIdentifier.rawValue, for: indexPath) as! ArticleTableViewCell
        cell.configure(data: viewModel.getArticle(for: indexPath))
        return cell
    }
    
    
}
