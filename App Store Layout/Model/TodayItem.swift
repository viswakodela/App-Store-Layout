//
//  TodayItem.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/9/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

struct TodayItem {
    let title: String
    let category: String
    let image: UIImage
    let description: String
    let color: UIColor
    
    let cellType: CellType
    
    enum CellType: String {
        case single
        case multiple
    }
    
}
