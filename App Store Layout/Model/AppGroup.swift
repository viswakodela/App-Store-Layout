//
//  AppGroup.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    
    let title: String
    let results: [FeedResult]
    
}

struct FeedResult: Decodable {
    
    let name: String
    let artistName: String
    let artistUrl: String
    let artworkUrl100: String
    
}
