//
//  TodayCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/8/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayCell: BaseTodayCell {
    
    override var todayItem: TodayItem? {
        didSet {
            categoryLabel.text = todayItem?.category
            titleLabel.text = todayItem?.title
            imageView.image = todayItem?.image
            descriptionLabel.text = todayItem?.description
            backgroundColor = todayItem?.color
        }
    }
    
    var topConstraint: NSLayoutConstraint?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    let categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "LIFE HACK"
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
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "zakaria-ahada-732726-unsplash")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "All the tools and apps you need to intelligently organize your life the right way"
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    func layout() {
        layer.cornerRadius = 16
        
        let imageContainerView = UIView()
        imageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        imageContainerView.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 240).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 240).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, categoryLabel, imageContainerView, descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        addSubview(stackView)
//        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24).isActive = true
        
        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
        self.topConstraint?.isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
