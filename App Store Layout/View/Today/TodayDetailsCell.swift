//
//  TodayDetailsCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/8/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayDetailsCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "There is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\nThere is Something to write here\n"
        label.backgroundColor = .green
        label.numberOfLines = 0
        return label
    }()
    
    func setupLayout() {
        addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
