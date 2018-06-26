//
//  HeadlineFilterVC.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 25/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

class HeadlineFilterVC: UIViewController {
    
    var headlineListDelegate: HeadlineListDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    func setupViews() {
        
        view.backgroundColor = UIColor.white
        
        let doneButtom = UIButton(type: .system)
        
        view.addSubview(doneButtom)
        
        doneButtom.setTitle("Done", for: .normal)
        doneButtom.titleLabel?.font = doneButtom.titleLabel?.font.withSize(20)
        doneButtom.translatesAutoresizingMaskIntoConstraints = false
        
        doneButtom.widthAnchor.constraint(equalToConstant: 100)
        doneButtom.heightAnchor.constraint(equalToConstant: 34)
        doneButtom.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -8)
        doneButtom.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        doneButtom.addTarget(self, action: #selector(HeadlineFilterVC.close(_:)), for: .touchUpInside)
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(customView: doneButtom)
    }
    
    @objc func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        //headlineListDelegate.fetchFilteredTopHeadlines(category: "test")
    }
}
