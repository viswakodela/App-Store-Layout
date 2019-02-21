//
//  AppsHeadwerController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AppsHeaderController: UICollectionViewController {
    
    //MARK:- Cell IDentifiers
    private static let horizontalHeaderId = "horizontalHeaderId"
    
    //MARK:- Variables
    var headerApps = [HeaderModel]()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    //MARK:- Methods
    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = .white
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
        
        collectionView.register(AppsHeaderCell.self, forCellWithReuseIdentifier: AppsHeaderController.horizontalHeaderId)
    }
}


//MARK:- CollectionView Methods
extension AppsHeaderController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return headerApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsHeaderController.horizontalHeaderId, for: indexPath) as! AppsHeaderCell
        let header = self.headerApps[indexPath.item]
        cell.headerModel = header
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width - 48, height: 280)
    }
    
}
