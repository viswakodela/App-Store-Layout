//
//  AppDetailsCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/1/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AppDetailsCell: UICollectionViewCell {
    
    var appResult: Result? {
        didSet {
            guard let urlString = appResult?.artworkUrl100, let url = URL(string: urlString) else {return}
            self.appImageView.sd_setImage(with: url)
            self.appNameLabel.text = appResult?.trackName
            self.priceButton.setTitle(appResult?.formattedPrice, for: .normal)
            self.releaseNotesLabel.text = appResult?.releaseNotes
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let appImageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 32
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor.lightGray.cgColor
        iv.layer.borderWidth = 0.2
        iv.clipsToBounds = true
        return iv
    }()
    
    let whatsNewlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "What's New"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let releaseNotesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Release Notes"
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Thumper"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        return label
    }()
    
    let priceButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = #colorLiteral(red: 0.1113199368, green: 0.4955177307, blue: 0.9525238872, alpha: 1)
        button.setTitle("$3.4", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        return button
    }()
    
    let seperatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.heightAnchor.constraint(equalToConstant: 0.2).isActive = true
        return view
    }()
    
    func setupLayout() {
        
        ////////
        let verticalStackView = UIStackView(arrangedSubviews: [appNameLabel, UIStackView(arrangedSubviews: [priceButton, UIView()]), UIView()])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 10
        
        ////////
        appImageView.widthAnchor.constraint(equalToConstant: 140).isActive = true
        appImageView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        let horizontalStackView = UIStackView(arrangedSubviews: [appImageView,
                                                                 verticalStackView])
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        
        ////////
        let overAllStackView = UIStackView(arrangedSubviews: [horizontalStackView,
                                                              whatsNewlabel,
                                                              releaseNotesLabel,
                                                              seperatorView])
        overAllStackView.translatesAutoresizingMaskIntoConstraints = false
        overAllStackView.spacing = 10
        overAllStackView.axis = .vertical
        
        addSubview(overAllStackView)
        
        overAllStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        overAllStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        overAllStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        overAllStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
