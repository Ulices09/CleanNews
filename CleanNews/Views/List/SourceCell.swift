//
//  SourceCell.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 24/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

class SourceCell: UICollectionViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.textColor = UIColor.primaryColor
        return label
    }()
    
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = label.font.withSize(12)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isUserInteractionEnabled = false
        textView.textContainer.maximumNumberOfLines = 6
        textView.textContainer.lineBreakMode = .byTruncatingTail
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.textAlignment = .justified
        textView.textColor = UIColor.darkGray
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.primaryColor.cgColor
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(descriptionTextView)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50)
        
        categoryLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        categoryLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        categoryLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        categoryLabel.heightAnchor.constraint(equalToConstant: 50)
        
        descriptionTextView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 12).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
    }
    
    func setupData(source: Source) {
        nameLabel.text = source.name
        if let category = source.category { categoryLabel.text = "(\(category))" }
        if let description = source.description { descriptionTextView.text = description }
    }
}














