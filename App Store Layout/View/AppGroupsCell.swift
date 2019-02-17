//
//  AppControllerCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/16/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//
import UIKit

class AppGroupsCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let horizontalCollectionView = HorizontalCollectionView(collectionViewLayout: UICollectionViewFlowLayout())
    
    //MARK:- Layout Properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "App Section"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.backgroundColor = .white
        return label
    }()
    
    //MARK:- Methods
    func setupLayout() {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        guard let horizontalView = horizontalCollectionView.view else {return}
        horizontalView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(horizontalView)
        horizontalView.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor).isActive = true
        horizontalView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        horizontalView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        horizontalView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
