//
//  HomeTabBarItemScreenViewController+RequestDelegate.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import Foundation

extension HomeTabBarItemScreenViewController: ViewRequestsDelegate {
    func didUpdate(with state: ViewState) {
        DispatchQueue.main.async {
            [weak self] in
            guard let self = self else {
                return
            }
            switch state {
            case .idle:
                break
            case .gettingData:
                break
            case .success:
                self.newsTableView.refreshControl?.endRefreshing()
                self.newsTableView.reloadData()
            case .failure(let error):
                let _ = error
                break
            }
        }
    }
        
}
