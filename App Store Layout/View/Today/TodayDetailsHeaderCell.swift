//
//  TodayDetailsHeaderCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/9/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayDetailsHeaderCell: UITableViewCell {
    
    let todayCell = TodayCell()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "close_button").withRenderingMode(.alwaysOriginal), for: .normal)
        return button
    }()
    
    func setLayout() {
        addSubview(todayCell)
        todayCell.translatesAutoresizingMaskIntoConstraints = false
        
        todayCell.topAnchor.constraint(equalTo: topAnchor).isActive = true
        todayCell.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        todayCell.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        todayCell.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        addSubview(closeButton)
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
