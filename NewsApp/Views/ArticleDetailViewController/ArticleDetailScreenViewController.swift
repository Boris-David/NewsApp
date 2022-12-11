//
//  ArticleDetailScreenViewController.swift
//  NewsApp
//
//  Created by Amissan on 05/12/2022.
//

import UIKit

class ArticleDetailScreenViewController: UIViewController {
    
    enum Route {
        case HomeTabBarItem
        //case
    }
    
    let viewModel: ArticleDetailScreenViewModel
    var router: Router
    
    @IBOutlet weak var articleUIImageView: UIImageView!
    @IBOutlet weak var articleAuthorUILabel: UILabel!
    @IBOutlet weak var articleDateUILabel: UILabel!
    @IBOutlet weak var articleTitleUILabel: UILabel!
    @IBOutlet weak var articleDescriptionUILabel: UILabel!
    @IBOutlet weak var articleLinkUIButton: UIButton!
    
    var articleLink: String? = ""

    required init(viewModel: ArticleDetailScreenViewModel) {
        
        self.viewModel = viewModel
        
        self.router = ArticleDetailScreenRouter(viewModel: self.viewModel)
        
        super.init(nibName: XibIdentifiers.articleDetail.rawValue, bundle: nil)

        self.viewModel.delegate = self

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViewElements()
    }
    
    private func configureViewElements() {
        let article = viewModel.getArticle()
        
        articleUIImageView.loadImageFrom(stringURLAddress: article.urlToImage ?? "")
        
        articleAuthorUILabel.text = article.author
        articleDateUILabel.text = article.publishedAt
        articleTitleUILabel.text = article.title
        articleDescriptionUILabel.text = article.description
        articleLink = article.url

    }
    
    @IBAction func readFullArticle(_ sender: Any) {
        viewModel.redirectToFullArticle(urlString: articleLink)
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
