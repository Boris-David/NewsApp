//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by Amissan on 04/12/2022.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var articleImageView: UIImageView!
    
    @IBOutlet weak var articleSourceNameLabel: UILabel!
    
    @IBOutlet weak var articlePublishedDateUILabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data:
    (
        sourceId: String?,
        sourceName: String?,
        author: String?,
        title: String?,
        description: String?,
        url: String?,
        urlToImage: String?,
        publishedAt: String?,
        content: String? )
    ) {
        articleTitleLabel.text = data.title
                
        articleImageView.loadImageFrom(stringURLAddress: data.urlToImage ?? "")
        articleImageView.layer.cornerRadius = 10
        articleSourceNameLabel.text = data.sourceName
    
        articleTitleLabel.text = data.title
        articleSourceNameLabel.text = data.sourceName
        articlePublishedDateUILabel.text = data.publishedAt
        
    }
}
