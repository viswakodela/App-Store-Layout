//
//  SearchResult.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/12/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import Foundation

struct SearchResults: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let trackName: String
    let primaryGenreName: String
    let artworkUrl100: String
    var screenshotUrls: [String]?
}
