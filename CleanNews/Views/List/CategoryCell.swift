//
//  CategoryCell.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 26/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.fontAwesomeIcon(name: .check, textColor: UIColor.primaryColor, size: CGSize(width: 25, height: 25))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(selectedImageView)
        
        let marginGuide = contentView.layoutMarginsGuide
        
        nameLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -8).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor, constant: 8).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: selectedImageView.leadingAnchor, constant: -8).isActive = true
        
        selectedImageView.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8).isActive = true
        selectedImageView.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor, constant: -8).isActive = true
        selectedImageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -8).isActive = true
        selectedImageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        
        
    }
    
    func setupData(category: String, selected: Bool) {
        nameLabel.text = category
        selectedImageView.isHidden = !selected
    }
    
}
