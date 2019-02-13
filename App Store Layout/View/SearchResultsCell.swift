//
//  SearchResultsCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/11/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit
import SDWebImage

class SearchResultsCell: UICollectionViewCell {
    
    //MARK: - Cell Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    var appResult: Result! {
        didSet {
            guard let url = URL(string: appResult.artworkUrl100) else {return}
            self.appIconImageView.sd_setImage(with: url)
            self.nameLabel.text = appResult.trackName
            self.categoryLabel.text = appResult.primaryGenreName
            
            guard let screenShotUrls = appResult.screenshotUrls else {return}
            if let url = URL(string: screenShotUrls[0]) {
                self.screenShot1ImageView.sd_setImage(with: url)
            }
            
            if screenShotUrls.count > 1 {
                if let url = URL(string: screenShotUrls[1]) {
                    self.screenShot2ImageView.sd_setImage(with: url)
                }
            }
            
            if screenShotUrls.count > 2 {
                if let url = URL(string: screenShotUrls[2]) {
                    self.screenShot3ImageView.sd_setImage(with: url)
                }
            }
        }
    }
    
    
    //MARK: - Layout Components
    let appIconImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
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
    lazy var screenShot3ImageView = self.createScreenShotImageView()
    
    //MARK: - Methods
    func createScreenShotImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 5
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
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
//        infoTopStackView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        infoTopStackView.alignment = .center
        
        let screenShotsStackView = UIStackView(arrangedSubviews: [screenShot1ImageView, screenShot2ImageView, screenShot3ImageView])
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
