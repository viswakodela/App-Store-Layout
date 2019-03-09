//
//  TodayCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/8/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "zakaria-ahada-732726-unsplash")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 16
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    func layout() {
        backgroundColor = .white
        layer.cornerRadius = 16
        addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
