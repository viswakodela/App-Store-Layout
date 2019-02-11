//
//  SearchResultsCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/11/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class SearchResultsCell: UICollectionViewCell {
    
    //MARK: - Cell Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    //MARK: - Layout Components
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 12
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Instagram"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photo & Video"
        return label
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "9.2M"
        label.textColor = .lightGray
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(white: 0.9, alpha: 1)
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.layer.cornerRadius = 12
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    lazy var screenShot1ImageView = self.createScreenShotImageView()
    lazy var screenShot2ImageView = self.createScreenShotImageView()
    lazy var screenSgot3ImageView = self.createScreenShotImageView()
    
    //MARK: - Methods
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .blue
        return imageView
    }
    
    func setupLayout() {
        
        backgroundColor = .white
        let lablesStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingLabel])
        lablesStackView.translatesAutoresizingMaskIntoConstraints = false
        lablesStackView.axis = .vertical
        
        let infoTopStackView = UIStackView(arrangedSubviews: [appIconImageView, lablesStackView, getButton])
        infoTopStackView.translatesAutoresizingMaskIntoConstraints = false
        infoTopStackView.axis = .horizontal
        infoTopStackView.spacing = 12
        infoTopStackView.alignment = .center
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [screenShot1ImageView, screenShot2ImageView, screenSgot3ImageView])
        screenShotsStackView.translatesAutoresizingMaskIntoConstraints = false
        screenShotsStackView.axis = .horizontal
        screenShotsStackView.spacing = 12
        screenShotsStackView.distribution = .fillEqually
        
        let overAllStackView = UIStackView(arrangedSubviews: [infoTopStackView, screenShotsStackView])
        overAllStackView.axis = .vertical
        overAllStackView.translatesAutoresizingMaskIntoConstraints = false
        overAllStackView.spacing = 12
        
        addSubview(overAllStackView)
        overAllStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        overAllStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        overAllStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        overAllStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
