//
//  SourceListVC.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 19/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

class SourceListVC: UIViewController {

    let mainLabel: UILabel = {
        let label = UILabel()
        label.text = "SOURCES"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        parent?.title = "Sources"
        self.view.addSubview(mainLabel)
        mainLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        mainLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
    }

}
