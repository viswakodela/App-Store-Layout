//
//  TodayMutlipleAppsController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayMultipleAppsController: UICollectionViewController {
    
    private static let multipleControllerCellID = "multipleControllerCellID"
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    var feedResults = [FeedResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        fetchData()
    }
    
    func collectionViewSetup() {
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: TodayMultipleAppsController.multipleControllerCellID)
    }
    
    func fetchData() {
        
        APIService.shared.fetchApps(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/25/explicit.json") { [weak self] (appGroup, err) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            guard let apps = appGroup else {return}
            self?.feedResults = apps.feed.results
            print(self?.feedResults.count)
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TodayMultipleAppsController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayMultipleAppsController.multipleControllerCellID, for: indexPath) as! MultipleAppCell
//        let result = feedResults[indexPath.item]
//        cell.appResults = result
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: 64)
    }
}
