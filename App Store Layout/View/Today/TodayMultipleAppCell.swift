//
//  TodayMultipleAppCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayMultipleAppCell: BaseTodayCell {
    
    override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            backgroundColor = todayItem?.color
            multipleAppController.feedResults = todayItem?.apps ?? []
            multipleAppController.collectionView.reloadData()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let multipleAppController = TodayMultipleAppsController(mode: .small)
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LIFE HACK"
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 26)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Utilizing your time"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    func setupLayout() {
        
        layer.cornerRadius = 16
        guard let multipleControllerView = multipleAppController.view else {return}
        multipleControllerView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, categoryLabel, multipleControllerView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true 
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
