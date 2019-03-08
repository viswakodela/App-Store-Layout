//
//  Review.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/7/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import Foundation

struct Reviews: Decodable {
    let feed: ReviewsFeed
}

struct ReviewsFeed: Decodable {
    let author: Author
    let entry: [Entry]
}

struct Author: Decodable {
    let name: Label
    let uri: Label
}

struct Label: Decodable {
    let label: String
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    let rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}
