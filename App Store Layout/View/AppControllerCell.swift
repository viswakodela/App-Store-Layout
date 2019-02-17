//
//  AppControllerCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/16/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AppControllerCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        setupLayout()
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "App Section"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.backgroundColor = .white
        return label
    }()
    
    let horizontalCollectionView = HorizontalCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
    
    func setupLayout() {
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        guard let horizontalView = horizontalCollectionView.view else {return}
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalView)
        horizontalView.topAnchor.constraint(equalTo: self.label.bottomAnchor).isActive = true
        horizontalView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        horizontalView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        horizontalView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
