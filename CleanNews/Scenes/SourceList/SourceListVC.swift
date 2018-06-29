//
//  SourceListVC.swift
//  CleanNews
//
//  Created by Ulices Meléndez on 19/06/18.
//  Copyright © 2018 Ulices Meléndez Acosta. All rights reserved.
//

import UIKit

protocol SourceListDisplayLogic: class {
    func displaySources(_ sources: [Source])
    func displayErrorMessage(_ errorMessage: String)
    func displayLoading()
    func hideLoading()
}

class SourceListVC: UIViewController {
    
    var interactor: SourceListBusinessLogic!
    
    var sources: [Source] = []
    var showedCellIndexes: [IndexPath] = []
    
    private var sourcesCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    private var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupViews()
        interactor.fetchSources()
    }
    
    private func setup() {
        let viewController = self
        let interactor = SourceListInteractor()
        let presenter = SourceListPresenter()
        let serviceWorker = SourceService()
        
        viewController.interactor = interactor
        interactor.presenter = presenter
        interactor.serviceWorker = serviceWorker
        presenter.viewController = viewController
        
    }
    
    private func setupViews() {
        title = "Sources"
        view.addSubview(sourcesCollectionView)
        
        sourcesCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        sourcesCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        sourcesCollectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        sourcesCollectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        sourcesCollectionView.delegate = self
        sourcesCollectionView.dataSource = self
        
        sourcesCollectionView.register(SourceCell.self, forCellWithReuseIdentifier: SourceCell.defaultReuseIdentifier)
    }

}

extension SourceListVC: SourceListDisplayLogic {
    func displaySources(_ sources: [Source]) {
        self.sources.append(contentsOf: sources)
        sourcesCollectionView.reloadData()
    }
    
    func displayErrorMessage(_ errorMessage: String) {
        
    }
    
    func displayLoading() {
        loadingView = displayLoadingView(view: view)
    }
    
    func hideLoading() {
        removeLoadinView(loadingView: loadingView)
    }
}

extension SourceListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sources.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sourcesCollectionView.dequeueReusableCell(withReuseIdentifier: SourceCell.defaultReuseIdentifier, for: indexPath) as! SourceCell
        let source = sources[indexPath.row]
        cell.setupData(source: source)
        return cell
    }
}

extension SourceListVC: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        if !showedCellIndexes.contains(indexPath) {
            showedCellIndexes.append(indexPath)
            cell.animateOnDisplay()
        }
    }
}

extension SourceListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lenght = UIScreen.main.bounds.width/2 - 15
        let itemSize = CGSize(width: lenght, height: lenght)
        return itemSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
















