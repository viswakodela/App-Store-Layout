//
//  ReviewController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/5/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class ReviewController: BaseCollectionViewController {
    
    private static let reviewsCellID = "reviewsCellID"
    
    var reviews = [Entry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = .white
        collectionView.register(ReviewsCell.self, forCellWithReuseIdentifier: ReviewController.reviewsCellID)
    }
}

extension ReviewController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewController.reviewsCellID, for: indexPath) as! ReviewsCell
        cell.review = self.reviews[indexPath.item]
        
        if let rating = Int(self.reviews[indexPath.item].rating.label) {
            for(index, view) in cell.starStackView.arrangedSubviews.enumerated() {
                view.alpha = index >= rating ? 0 : 1
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 48)
        return CGSize(width: width, height: view.frame.height)
    }
}
