//
//  PreviewImageCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/1/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class PreviewImageCell: UICollectionViewCell {
    
    var imageUrl: String? {
        didSet {
            guard let imageurl = imageUrl, let url = URL(string: imageurl) else {return}
            imageview.sd_setImage(with: url)
        }
    }
    
    let imageview: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        clipsToBounds = true
        addSubview(imageview)
        imageview.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageview.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageview.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageview.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
