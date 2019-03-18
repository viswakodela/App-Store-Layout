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
    let trackId: Int
    var trackName: String?
    var primaryGenreName: String?
    var artworkUrl100: String?
    var screenshotUrls: [String]?
    var averageUserRating: Float?
    var formattedPrice: String?
    var description: String?
    var releaseNotes: String?
}
