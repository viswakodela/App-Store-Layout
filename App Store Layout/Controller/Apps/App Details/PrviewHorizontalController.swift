//
//  PrviewHorizontalController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/1/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class PreviewHorizontalController: BaseCollectionViewController2 {
    
    private static let previewImageCellId = "previewImageCellId"
    
    
    var appData: Result? {
        didSet {
            guard let screenShots = appData?.screenshotUrls else {return}
            self.appScreenShots = screenShots
        }
    }
    
    var appScreenShots = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        collectionView.register(PreviewImageCell.self, forCellWithReuseIdentifier: PreviewHorizontalController.previewImageCellId)
    }
}


extension PreviewHorizontalController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appScreenShots.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PreviewHorizontalController.previewImageCellId, for: indexPath) as! PreviewImageCell
        let appScreenShot = appScreenShots[indexPath.item]
        cell.imageUrl = appScreenShot
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: view.frame.height)
    }
    
}
