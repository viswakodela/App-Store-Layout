//
//  AppsPageHeader.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    //MARK:- Constants
    let appsHeaderController = AppsHeaderController()
    
    //MARK:- Cell Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    //MARK:- Methods
    fileprivate func setupLayout() {
        
        guard let headerView = appsHeaderController.view else {return}
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(headerView)
        headerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        headerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        headerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        headerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
