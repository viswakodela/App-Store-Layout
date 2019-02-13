//
//  SearchViewController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/9/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK: - Cell Identifiers
    private static let searchCellID = "SearchCellID"
    
    var appResults: [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchItunesApps()
    }
    
    //MARK: - Layout Properties
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK: - Methods
    func setupCollectionView() {
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: SearchViewController.searchCellID)
        collectionView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        
        view.addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func fetchItunesApps() {
        APIService.shared.fetchApps { (results, err) in
            
            if let error = err {
                print(error.localizedDescription)
            }
            self.appResults = results
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
}

    //MARK: - CollectionViewDelegate and DataSource Methods
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let apps = appResults else {return 0}
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchViewController.searchCellID, for: indexPath) as! SearchResultsCell
        let appResult = self.appResults?[indexPath.item]
        cell.appResult = appResult
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}
