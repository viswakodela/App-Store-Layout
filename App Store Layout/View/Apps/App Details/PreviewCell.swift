//
//  PreviewCell.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/1/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class PreviewCell: UICollectionViewCell {
    
    let horizontalPreviewController = PreviewHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    func layout() {
        guard let previewView = horizontalPreviewController.view else {return}
        previewView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(previewView)
        previewView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        previewView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        previewView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        previewView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
