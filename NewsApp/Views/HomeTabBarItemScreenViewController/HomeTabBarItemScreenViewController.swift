//
//  HomeTabBarItemScreenViewController.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import UIKit

class HomeTabBarItemScreenViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    
    let viewModel: HomeTabBarItemScreenViewModel
    
    required init(viewModel: HomeTabBarItemScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: XibIdentifiers.homeTabBarItem.rawValue, bundle: nil)
        self.viewModel.delegate = self

        //viewModel.loadNews()
    }
    
    required init?(coder: NSCoder) {
        //super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        newsTableView.re
//    }
//
//    required init(viewModel: HomeTabBarItemScreenViewModel) {
//        self.viewModel = viewModel
//        super.init()
//        self.viewModel.delegate = self
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //let xib = UINib(nibName: XibIdentifiers.articleCell.rawValue, bundle: nil)
        //newsTableView.register(xib, forCellReuseIdentifier: XibIdentifiers.articleCell.rawValue)
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //
        super.viewWillAppear(animated)
        viewModel.loadNews()
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
