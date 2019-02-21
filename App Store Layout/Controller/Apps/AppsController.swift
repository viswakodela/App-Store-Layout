//
//  AppsController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/9/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AppsController: UIViewController {
    
    //MARK:- Cell Identifiers
    private static let appCellId = "appCellId"
    private static let headerId = "headerId"
    
    //MARK:- Variables
    var editorChoiceAppGroup: AppGroup?
    var headerData = [HeaderModel]()
    var groups = [AppGroup]()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchData()
    }
    
    //MARK:- Layout Properties
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        collectionView.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //MARK:- Methods
    func setupCollectionView() {
        view.backgroundColor = .white
        
        collectionView.register(AppGroupsCell.self, forCellWithReuseIdentifier: AppsController.appCellId)
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppsController.headerId)
        
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func fetchData() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        APIService.shared.fetchApps(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/25/explicit.json") { [weak self] (appGroup, err) in
            dispatchGroup.leave()
            print("Done with Top Grossing app")
            if let error = err {
                print("Failed to fetch Games:", error)
            }
            guard let appGroup = appGroup else {return}
            self?.editorChoiceAppGroup = appGroup
            self?.groups.append(appGroup)
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchApps(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json") { [weak self] (appGroup, err) in
            dispatchGroup.leave()
            print("Done with Top Free apps")
            if let error = err {
                print("Failed fetching Top Free Apps", error)
            }
            
            guard let topFreeAppsGroup = appGroup else {return}
            self?.groups.append(topFreeAppsGroup)
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchApps(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json") { [weak self] (appGroup, err) in
            dispatchGroup.leave()
            print("Done with new games we love")
            if let error = err {
                print("Failed fetching Top Free Apps", error)
            }
            
            guard let newGamesWeLove = appGroup else {return}
            self?.groups.append(newGamesWeLove)
        }
        
        dispatchGroup.enter()
        APIService.shared.fetchSocialAppsForHeader(urlString: "https://api.letsbuildthatapp.com/appstore/social") { (results, err) in
            dispatchGroup.leave()
            if let error = err {
                print(error.localizedDescription)
                return
            }
            guard let results = results else {return}
            self.headerData = results
        
        }
        
        dispatchGroup.notify(queue: .main) { 
            self.collectionView.reloadData()
        }
    }
}


//MARK:-  CollectionView Delegate Methods
extension AppsController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.groups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsController.appCellId, for: indexPath) as! AppGroupsCell
        let appgroup = self.groups[indexPath.item]
        cell.titleLabel.text = appgroup.feed.title
        cell.horizontalCollectionView.appGroup = appgroup
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    //Header Methods
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: AppsController.headerId, for: indexPath) as! AppsPageHeader
        headerCell.appsHeaderController.headerApps = self.headerData
        headerCell.appsHeaderController.collectionView.reloadData()
        return headerCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 300)
    }
    
}
