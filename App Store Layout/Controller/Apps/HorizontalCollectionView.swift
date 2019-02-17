//
//  HorizontalCollectionView.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/16/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class HorizontalCollectionView: UICollectionViewController {
    
    //MARK: - Variables and Constants
    private static let horizontalCellId = "horizontalCellId"
    var feedResults = [FeedResult]()
    
    var appGroup: AppGroup? {
        didSet {
            guard let appGroup = self.appGroup else {return}
            self.feedResults = appGroup.feed.results
            self.collectionView.reloadData()
        }
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    //MARK:- Methods
    func setupLayout() {
        collectionView.backgroundColor = .white
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.register(AppsRowCell.self, forCellWithReuseIdentifier: HorizontalCollectionView.horizontalCellId)
    }
}

//MARK:- CollectionView Methods
extension HorizontalCollectionView: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionView.horizontalCellId, for: indexPath) as! AppsRowCell
        cell.appResults = self.feedResults[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let topBottom: CGFloat = 24
        let leftRight: CGFloat = 20
        let height = (view.frame.height - topBottom - leftRight) / 3
        return CGSize(width: (view.frame.width - 48), height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
}
