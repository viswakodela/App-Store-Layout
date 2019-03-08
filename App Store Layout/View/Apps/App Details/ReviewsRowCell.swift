//
//  ReviewsRowCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/5/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class ReviewsRowCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let reviewsAndRatingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Reviews & Rating"
        return label
    }()
    
    let reviewsController = ReviewController()
    
    func setupLayout() {
        addSubview(reviewsAndRatingLabel)
        reviewsAndRatingLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        reviewsAndRatingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        reviewsAndRatingLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        guard let collectionView = reviewsController.view else {return}
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: reviewsAndRatingLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 4).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
