//
//  MultipleAppCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class MultipleAppCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    var appResults: FeedResult? {
        didSet {
            guard let result = appResults else {return}
            guard let url = URL(string: result.artworkUrl100 ?? "") else {return}
            self.imageView.sd_setImage(with: url)
            self.appNameLabel.text = result.name
            self.categoryLabel.text = result.artistName
        }
    }
    
    //MARK:- Layout Properties
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "App Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Category Label"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    let getButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        return button
    }()
    
    //MARK:-  Methods
    func setupLayout() {
        
        imageView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        getButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        let verticalStackView = UIStackView(arrangedSubviews: [appNameLabel, categoryLabel])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.spacing = 8
        verticalStackView.axis = .vertical
        
        let ovarAllStackView = UIStackView(arrangedSubviews: [imageView, verticalStackView, getButton])
        ovarAllStackView.translatesAutoresizingMaskIntoConstraints = false
        ovarAllStackView.spacing = 10
        ovarAllStackView.axis = .horizontal
        ovarAllStackView.alignment = .center
        
        addSubview(ovarAllStackView)
        ovarAllStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        ovarAllStackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        ovarAllStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        ovarAllStackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
