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
    
    let categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]
    var currentCategory: String!
    
    var categoriesTableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        //view.backgroundColor = UIColor.white
        title = "Categories"
        setupTabBarItems()
        setupTableView()
    }
    
    private func setupTabBarItems() {
        let doneButtom = UIButton(type: .system)
        view.addSubview(doneButtom)
        doneButtom.setTitle("Done", for: .normal)
        doneButtom.titleLabel?.font = doneButtom.titleLabel?.font.withSize(20)
        doneButtom.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
        doneButtom.addTarget(self, action: #selector(HeadlineFilterVC.close(_:)), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: doneButtom)
    }
    
    private func setupTableView() {
        view.addSubview(categoriesTableView)
        
        categoriesTableView.translatesAutoresizingMaskIntoConstraints = false
        categoriesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        categoriesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        categoriesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        categoriesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        categoriesTableView.setupEmptyFooterView()
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        
        categoriesTableView.register(CategoryCell.self, forCellReuseIdentifier: CategoryCell.defaultReuseIdentifier)
    }
    
    @objc func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}

extension HeadlineFilterVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: CategoryCell.defaultReuseIdentifier, for: indexPath) as! CategoryCell
        let category = categories[indexPath.row]
        let selected = category == currentCategory
        cell.setupData(category: category, selected: selected)
        return cell
    }
}

extension HeadlineFilterVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        currentCategory = category
        categoriesTableView.reloadData()
        headlineListDelegate.fetchFilteredTopHeadlines(category: category)
    }
}













