//
//  ViewController.swift
//  NewsApp
//
//  Created by Amissan on 28/11/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NewsService.getNewsFromCategory(.Technologie, of: .fr, maxNumberOfResults: 40) {
            res in return
            print(res)
        }
       // News.getMostNotableSourcesHeadlines()
        
        
        
    }


}

