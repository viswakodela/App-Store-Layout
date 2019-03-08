//
//  ReviewsCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/5/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class ReviewsCell: UICollectionViewCell {
    
    var review: Entry? {
        didSet {
            titleLabel.text = review?.title.label
            nameLabel.text = review?.author.name.label
            descriptionLabel.text = review?.content.label
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title Label"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Name Label"
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let starsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 10
        return label
    }()
    
    let starStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0..<5).forEach({ (_) in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
            imageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
            arrangedSubviews.append(imageView)
        })
        arrangedSubviews.append(UIView())
        let sv = UIStackView(arrangedSubviews: arrangedSubviews)
        return sv
    }()
    
    func setupLayout() {
        backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let horizontalLabel = UIStackView(arrangedSubviews: [titleLabel, nameLabel])
        horizontalLabel.axis = .horizontal
        horizontalLabel.spacing = 8
        horizontalLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        
        starsLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let verticalStackView = UIStackView(arrangedSubviews: [horizontalLabel, starStackView, descriptionLabel])
        verticalStackView.spacing = 4
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        
        addSubview(verticalStackView)
        verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
