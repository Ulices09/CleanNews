//
//  ArticleCell.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 17/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit
import SDWebImage

class ArticleCell: UITableViewCell {
    
    private let titleTextView: UITextView = {
        let textView = UITextView()
        textView.text = "Test label"
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.font = UIFont.boldSystemFont(ofSize: 17)
        textView.textContainer.maximumNumberOfLines = 3
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        return textView
    }()
    
    private let sourceLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.primaryColor
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let articleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.image = #imageLiteral(resourceName: "news_placeholder")
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        autoresizesSubviews = true
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        let bottomContainer = UIView()
        
        contentView.addSubview(bottomContainer)
        
        contentView.addSubview(articleImageView)
        contentView.addSubview(titleTextView)
        bottomContainer.addSubview(sourceLabel)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        articleImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8).isActive = true
        articleImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        articleImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        articleImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        titleTextView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8).isActive = true
        titleTextView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titleTextView.trailingAnchor.constraint(equalTo: articleImageView.leadingAnchor, constant: -8).isActive = true
        titleTextView.bottomAnchor.constraint(equalTo: bottomContainer.topAnchor, constant: -8).isActive = true
        
        bottomContainer.translatesAutoresizingMaskIntoConstraints = false
        bottomContainer.topAnchor.constraint(equalTo: articleImageView.bottomAnchor, constant: 8).isActive = true
        bottomContainer.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        bottomContainer.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        bottomContainer.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true

        sourceLabel.topAnchor.constraint(equalTo: bottomContainer.topAnchor).isActive = true
        sourceLabel.bottomAnchor.constraint(equalTo: bottomContainer.bottomAnchor).isActive = true
        sourceLabel.leadingAnchor.constraint(equalTo: bottomContainer.leadingAnchor).isActive = true
        sourceLabel.trailingAnchor.constraint(equalTo: bottomContainer.trailingAnchor).isActive = true
        
        // TODO: Add date next to sourceLabel
        
    }
    
    func setupData(article: Article) {
        
        if let urlToImage = article.urlToImage {
            articleImageView.sd_setImage(with: URL(string: urlToImage)) { (image, error, cacheType, url) in
                if error == nil { self.articleImageView.image = image }
                else {
                    print("Error")
                    self.articleImageView.image = #imageLiteral(resourceName: "news_placeholder") }
            }
        } else {
            print("Es null")
            articleImageView.image = #imageLiteral(resourceName: "news_placeholder")
        }
        
        titleTextView.text = article.title ?? "gg"
        sourceLabel.text = "BBC News"
    }
    
}
