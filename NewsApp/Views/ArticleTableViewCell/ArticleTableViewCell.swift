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
    @IBOutlet weak var articleDescriptionLabel: UILabel!
    
    @IBOutlet weak var likeArticleButton: UIButton!
    
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
        //articleTitleLabel.showsExpansionTextWhenTruncated = true
        articleImageView.loadImageFrom(stringURLAddress: data.urlToImage ?? "")
        articleDescriptionLabel.text = data.description
        //articleTitleLabel.showsExpansionTextWhenTruncated = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
