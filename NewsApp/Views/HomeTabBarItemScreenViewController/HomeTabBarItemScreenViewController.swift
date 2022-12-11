//
//  HomeTabBarItemScreenViewController.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import UIKit

class HomeTabBarItemScreenViewController: UIViewController {
    
    enum Route: String {
        case articleDetail
    }

    @IBOutlet weak var newsTableView: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    let viewModel: HomeTabBarItemScreenViewModel
    var router: Router
    
    required init(viewModel: HomeTabBarItemScreenViewModel) {
        self.viewModel = viewModel
        self.router = HomeTabBarItemScreenRouter(viewModel: self.viewModel)
        super.init(nibName: XibIdentifiers.homeTabBarItem.rawValue, bundle: nil)
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        //super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        newsTableView.delegate = self
        newsTableView.dataSource = self
        
        newsTableView.backgroundColor = .white
                
        viewModel.loadNews()
        
        refreshControl.attributedTitle = NSAttributedString(string: "Actualisation...")
        refreshControl.addTarget(self, action: #selector(self.refresh(sender:)), for: .valueChanged)
        newsTableView.refreshControl = refreshControl

    }
    
    @objc func refresh(sender: AnyObject) {
        self.viewModel.loadNews()
        newsTableView.refreshControl?.endRefreshing()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedIndexPath = newsTableView.indexPathForSelectedRow {
            newsTableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}
