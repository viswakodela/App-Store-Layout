//
//  AppsHeaderCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AppsHeaderCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    var headerModel: HeaderModel! {
        didSet {
            self.companyLabel.text = headerModel.name
             let imageUrl = headerModel.imageUrl
            guard let url = URL(string: imageUrl) else {return}
            self.imageView.sd_setImage(with: url)
            self.titleLable.text = headerModel.tagline
        }
    }
    
    //MARK:- Layout Properties
    let companyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .blue
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24)
        label.numberOfLines = 0
        return label
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.backgroundColor = .red
        iv.layer.cornerRadius = 12
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    //MARK:- Methods
    fileprivate func setupLayout() {
        
        let stackView = UIStackView(arrangedSubviews: [companyLabel, titleLable, imageView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.axis = .vertical
        
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
