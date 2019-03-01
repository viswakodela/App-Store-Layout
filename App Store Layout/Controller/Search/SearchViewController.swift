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
    
    var appResults = [Result]()
    var timer: Timer?
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupSearchBar()
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
    
    let searchController: UISearchController = UISearchController(searchResultsController: nil)
    
    let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .white)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.color = .gray
        activity.hidesWhenStopped = true
        return activity
    }()
    
    let enterSearchTermLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Please enter search term above"
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    //MARK: - Methods
    func setupCollectionView() {
        collectionView.register(SearchResultsCell.self, forCellWithReuseIdentifier: SearchViewController.searchCellID)
        collectionView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        collectionView.keyboardDismissMode = .interactive
        
        view.addSubview(collectionView)
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        view.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        collectionView.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: 100).isActive = true
        enterSearchTermLabel.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: 50).isActive = true
        enterSearchTermLabel.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: -50).isActive = true
        enterSearchTermLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
}

    //MARK: - CollectionViewDelegate and DataSource Methods
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        self.enterSearchTermLabel.isHidden = appResults.count != 0
        return appResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchViewController.searchCellID, for: indexPath) as! SearchResultsCell
        let appResult = self.appResults[indexPath.item]
        cell.appResult = appResult
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
}

//MARK: - SearchBar Delegate
extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        activityIndicator.startAnimating()
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {[weak self] (_) in
            self?.activityIndicator.stopAnimating()
            APIService.shared.fetchApps(searchTerm: searchText) { (results, err) in
                if let error = err {
                    print(error.localizedDescription)
                }
                guard let result = results else {return}
                self?.appResults = result.results
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        })
    }
}
